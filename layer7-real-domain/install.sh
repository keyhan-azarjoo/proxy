#!/bin/bash
set -euo pipefail

# ============================================
# Layer 7: Real Domain + TLS (VLESS)
# ============================================

SCRIPT_VERSION="2.0.0"
LOG_FILE="/var/log/ssh-proxy.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

preflight_check() {
    log "Running pre-flight checks..."

    if ! grep -q "Ubuntu" /etc/os-release 2>/dev/null; then
        echo "Warning: Designed for Ubuntu, continuing anyway..."
    fi

    [ "$EUID" -ne 0 ] && { echo "Error: Run as root"; exit 1; }

    AVAILABLE=$(df / | tail -1 | awk '{print $4}')
    [ "$AVAILABLE" -lt 1048576 ] && { echo "Error: Need 1GB+ disk space"; exit 1; }

    if ss -tulpn | grep -q ":443 "; then
        echo "Warning: Port 443 in use. Will be freed."
    fi

    if ss -tulpn | grep -q ":80 "; then
        echo "Warning: Port 80 in use. Certbot needs it."
    fi

    log "Pre-flight checks passed"
}

main() {
    echo "============================================"
    echo " Layer 7: Real Domain + TLS (VLESS)"
    echo " Version: $SCRIPT_VERSION"
    echo "============================================"
    echo ""
    echo "This will:"
    echo "  - Install Xray (V2Ray core)"
    echo "  - Configure VLESS protocol"
    echo "  - Enable WebSocket transport"
    echo "  - Get a REAL TLS certificate (Let's Encrypt)"
    echo "  - Use port 443 (real HTTPS)"
    echo ""

    read -p "Enter your domain (FQDN): " DOMAIN
    read -p "Enter email for Let's Encrypt: " EMAIL

    if [ -z "$DOMAIN" ] || [ -z "$EMAIL" ]; then
        echo "Error: domain and email are required"
        exit 1
    fi

    # DuckDNS auto-update setup
    DUCKDNS_TOKEN=""
    DUCKDNS_SUBDOMAIN=""
    if [[ "$DOMAIN" == *.duckdns.org ]]; then
        DUCKDNS_SUBDOMAIN="${DOMAIN%.duckdns.org}"
        echo ""
        echo "DuckDNS domain detected: $DOMAIN"
        read -p "Enter your DuckDNS token (leave empty to skip): " DUCKDNS_TOKEN
        if [ -z "$DUCKDNS_TOKEN" ]; then
            echo "Warning: No DuckDNS token provided. Skipping automatic DNS update."
        fi
    fi

    preflight_check

    log "=== Starting Layer 7 installation ==="

    # Remove conflicting services
    echo "Removing conflicting services..."
    systemctl stop stunnel4 2>/dev/null || true
    systemctl disable stunnel4 2>/dev/null || true
    apt purge -y stunnel4 2>/dev/null || true
    rm -rf /etc/stunnel

    for svc in nginx apache2 httpd plesk psa sw-cp-server sw-engine; do
        systemctl stop "$svc" 2>/dev/null || true
        systemctl disable "$svc" 2>/dev/null || true
        systemctl mask "$svc" 2>/dev/null || true
    done
    log "Conflicting services removed"

    # Install dependencies
    echo "Installing dependencies..."
    apt update -y
    apt install -y curl unzip openssl ufw jq certbot
    log "Dependencies installed"

    # Update DuckDNS DNS record (before certbot, so domain resolves to this server)
    if [ -n "$DUCKDNS_TOKEN" ]; then
        echo "Updating DuckDNS DNS record..."
        DUCKDNS_RESPONSE=$(curl -s "https://www.duckdns.org/update?domains=${DUCKDNS_SUBDOMAIN}&token=${DUCKDNS_TOKEN}&ip=")
        if [ "$DUCKDNS_RESPONSE" = "OK" ]; then
            log "DuckDNS DNS updated successfully"
        else
            log "WARNING: DuckDNS update failed (response: $DUCKDNS_RESPONSE)"
            echo "Warning: DuckDNS update failed. Make sure your token is correct."
            echo "Continuing anyway..."
        fi

        # Set up cron job for automatic DNS update every 5 minutes
        echo "Setting up DuckDNS auto-update cron job..."
        CRON_CMD="*/5 * * * * curl -fs \"https://www.duckdns.org/update?domains=${DUCKDNS_SUBDOMAIN}&token=${DUCKDNS_TOKEN}&ip=\" >/dev/null"
        (crontab -l 2>/dev/null | grep -v "duckdns.org/update"; echo "$CRON_CMD") | crontab -
        log "DuckDNS auto-update cron job configured (every 5 minutes)"
    fi

    # Firewall
    echo "Configuring firewall..."
    ufw allow 80/tcp
    ufw allow 443/tcp
    ufw --force enable
    log "Firewall configured"

    # Install Xray
    echo "Installing Xray..."
    bash <(curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh) || {
        log "ERROR: Xray installation failed"
        exit 1
    }
    log "Xray installed"

    # Obtain TLS certificate
    echo "Requesting TLS certificate..."
    certbot certonly --standalone \
      -d "$DOMAIN" \
      --non-interactive \
      --agree-tos \
      -m "$EMAIL" || {
        log "ERROR: Certbot failed"
        exit 1
    }

    systemctl enable --now certbot.timer 2>/dev/null || true
    log "TLS certificate issued"

    # Generate WebSocket path
    WS_PATH="/$(cat /proc/sys/kernel/random/uuid | cut -d'-' -f1)"

    # Copy certs (not symlink — Let's Encrypt dirs are 0700 root-only)
    mkdir -p /etc/xray/certs
    cp "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" /etc/xray/certs/cert.pem
    cp "/etc/letsencrypt/live/$DOMAIN/privkey.pem" /etc/xray/certs/private.key

    # Certbot renewal hook to copy new certs and restart xray
    mkdir -p /etc/letsencrypt/renewal-hooks/deploy
    cat > /etc/letsencrypt/renewal-hooks/deploy/xray-certs.sh <<HOOK
#!/bin/bash
cp "/etc/letsencrypt/live/$DOMAIN/fullchain.pem" /etc/xray/certs/cert.pem
cp "/etc/letsencrypt/live/$DOMAIN/privkey.pem" /etc/xray/certs/private.key
chown nobody:nogroup /etc/xray/certs/cert.pem /etc/xray/certs/private.key
chmod 644 /etc/xray/certs/cert.pem /etc/xray/certs/private.key
systemctl restart xray
HOOK
    chmod 755 /etc/letsencrypt/renewal-hooks/deploy/xray-certs.sh

    # Fix permissions
    chmod 755 /usr /usr/local /usr/local/etc
    mkdir -p /usr/local/etc/xray
    chmod 755 /usr/local/etc/xray

    chown -R nobody:nogroup /etc/xray /usr/local/etc/xray
    chmod 644 /etc/xray/certs/cert.pem /etc/xray/certs/private.key

    # Create Xray config
    echo "Configuring Xray..."
    cat > /usr/local/etc/xray/config.json <<EOF
{
  "log": {
    "loglevel": "warning"
  },
  "inbounds": [
    {
      "listen": "0.0.0.0",
      "port": 443,
      "protocol": "vless",
      "settings": {
        "clients": [],
        "decryption": "none"
      },
      "streamSettings": {
        "network": "ws",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "/etc/xray/certs/cert.pem",
              "keyFile": "/etc/xray/certs/private.key"
            }
          ]
        },
        "wsSettings": {
          "path": "$WS_PATH"
        }
      }
    }
  ],
  "outbounds": [
    { "protocol": "freedom" }
  ]
}
EOF

    chown nobody:nogroup /usr/local/etc/xray/config.json
    chmod 644 /usr/local/etc/xray/config.json

    # Save empty user database and server config
    mkdir -p /usr/local/etc/xray
    echo "{}" > /usr/local/etc/xray/users.json
    chmod 644 /usr/local/etc/xray/users.json

    # Save server config (domain, path) for add-user script
    if [ -n "$DUCKDNS_TOKEN" ]; then
        cat > /usr/local/etc/xray/server-config.json <<EOF
{
  "domain": "$DOMAIN",
  "ws_path": "$WS_PATH",
  "protocol": "vless",
  "duckdns_token": "$DUCKDNS_TOKEN",
  "duckdns_subdomain": "$DUCKDNS_SUBDOMAIN"
}
EOF
    else
        cat > /usr/local/etc/xray/server-config.json <<EOF
{
  "domain": "$DOMAIN",
  "ws_path": "$WS_PATH",
  "protocol": "vless"
}
EOF
    fi
    chmod 644 /usr/local/etc/xray/server-config.json

    log "Xray configured"

    # Allow Xray (running as nobody) to read certs via systemd override
    mkdir -p /etc/systemd/system/xray.service.d
    cat > /etc/systemd/system/xray.service.d/override.conf <<OVERRIDE
[Service]
ReadOnlyPaths=/etc/xray/certs
OVERRIDE

    # Start Xray
    echo "Starting Xray..."
    systemctl daemon-reexec
    systemctl daemon-reload
    systemctl enable xray
    systemctl restart xray

    sleep 3

    if ! systemctl is-active --quiet xray; then
        log "ERROR: Xray failed to start"
        echo "Error: Xray failed"
        journalctl -xe -u xray --no-pager | tail -30
        exit 1
    fi

    log "Xray started successfully"

    # Save installation info
    SERVER_IP=$(curl -s --max-time 5 ifconfig.me 2>/dev/null || echo "Unknown")
    cat > /root/proxy-installation-info.txt <<EOF
Installation Details
====================
Date: $(date)
Layer: 7 (Real Domain + TLS)
Port: 443
Protocol: VLESS + WebSocket + TLS
Script Version: $SCRIPT_VERSION

Domain: $DOMAIN
Server IP: $SERVER_IP
WebSocket Path: $WS_PATH

Config Location: /usr/local/etc/xray/config.json
Users Database: /usr/local/etc/xray/users.json
Server Config: /usr/local/etc/xray/server-config.json
EOF

    if [ -n "$DUCKDNS_TOKEN" ]; then
        cat >> /root/proxy-installation-info.txt <<EOF

DuckDNS Subdomain: $DUCKDNS_SUBDOMAIN
DuckDNS Auto-Update: Enabled (cron every 5 minutes)
EOF
    fi

    touch "$LOG_FILE"

    log "=== Layer 7 installation completed ==="

    # Final output
    echo ""
    echo "============================================"
    echo " Installation Complete!"
    echo "============================================"
    echo ""
    echo "V2Ray VLESS is now active on port 443"
    echo ""
    echo "Domain: $DOMAIN"
    echo "Server IP: $SERVER_IP"
    echo "Port: 443"
    echo "Protocol: VLESS + WebSocket + TLS"
    echo ""
    if [ -n "$DUCKDNS_TOKEN" ]; then
        echo "DuckDNS Auto-Update: Enabled (every 5 minutes)"
        echo ""
    fi
    echo "Next step: Add a user to get connection config"
    echo ""
    echo "Management commands:"
    echo "-------------------"
    echo "  Add user:    curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/add-user.sh -o add-user.sh && bash add-user.sh"
    echo "  Delete user: curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/delete-user.sh -o delete-user.sh && bash delete-user.sh <username>"
    echo "  Status:      systemctl status xray"
    echo ""
    echo "============================================"
}

trap 'log "ERROR: Installation failed at line $LINENO"; exit 1' ERR
main "$@"
