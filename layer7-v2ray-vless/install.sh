#!/bin/bash
set -euo pipefail

# ============================================
# Layer 7: V2Ray VLESS + WebSocket + TLS
# Modern protocol with high stealth
# ============================================

SCRIPT_VERSION="2.0.0"
LOG_FILE="/var/log/ssh-proxy.log"

log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" | tee -a "$LOG_FILE"
}

preflight_check() {
    log "Running pre-flight checks..."

    if ! grep -q "Ubuntu" /etc/os-release 2>/dev/null; then
        echo "Warning: Designed for Ubuntu"
        read -p "Continue? (yes/no): " CONTINUE
        [ "$CONTINUE" != "yes" ] && exit 0
    fi

    [ "$EUID" -ne 0 ] && { echo "Error: Run as root"; exit 1; }

    AVAILABLE=$(df / | tail -1 | awk '{print $4}')
    [ "$AVAILABLE" -lt 1048576 ] && { echo "Error: Need 1GB+ disk space"; exit 1; }

    if ss -tulpn | grep -q ":443 "; then
        echo "Warning: Port 443 in use. Will be freed."
        read -p "Continue? (yes/no): " CONTINUE
        [ "$CONTINUE" != "yes" ] && exit 0
    fi

    log "Pre-flight checks passed"
}

main() {
    echo "============================================"
    echo " Layer 7: V2Ray VLESS + WebSocket + TLS"
    echo " Version: $SCRIPT_VERSION"
    echo "============================================"
    echo ""
    echo "This will:"
    echo "  • Install Xray (V2Ray core)"
    echo "  • Configure VLESS protocol"
    echo "  • Enable WebSocket transport"
    echo "  • Create TLS certificate"
    echo "  • Use port 443 (HTTPS)"
    echo ""
    echo "Highest stealth level - looks like normal HTTPS traffic"
    echo ""

    preflight_check

    read -p "Continue? (yes/no): " CONFIRM
    [ "$CONFIRM" != "yes" ] && exit 0

    log "=== Starting Layer 7 VLESS installation ==="

    # Remove conflicting services
    echo ""
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
    echo ""
    echo "Installing dependencies..."
    apt update -y
    apt install -y curl unzip openssl ufw jq
    log "Dependencies installed"

    # Install Xray
    echo "Installing Xray..."
    bash <(curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh) || {
        log "ERROR: Xray installation failed"
        exit 1
    }
    log "Xray installed"

    # Generate UUID and path
    UUID=$(cat /proc/sys/kernel/random/uuid)
    WS_PATH="/$(cat /proc/sys/kernel/random/uuid | cut -d'-' -f1)"

    echo ""
    echo "Generated credentials:"
    echo "  UUID: $UUID"
    echo "  WebSocket Path: $WS_PATH"
    echo ""

    # Create certificate
    echo "Creating TLS certificate..."
    mkdir -p /etc/xray/certs

    openssl req -new -x509 -nodes -days 3650 \
      -keyout /etc/xray/certs/private.key \
      -out /etc/xray/certs/cert.pem \
      -subj "/C=XX/ST=Self/L=Self/O=PrivateProxy/CN=proxy.local"

    # Fix permissions
    chmod 755 /usr /usr/local /usr/local/etc
    mkdir -p /usr/local/etc/xray
    chmod 755 /usr/local/etc/xray

    chown -R nobody:nogroup /etc/xray /usr/local/etc/xray
    chmod 644 /etc/xray/certs/cert.pem /etc/xray/certs/private.key

    log "Certificate created"

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
        "clients": [
          { "id": "$UUID" }
        ],
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

    # Save user database
    mkdir -p /usr/local/etc/xray
    echo "{\"default\":\"$UUID\"}" > /usr/local/etc/xray/users.json
    chmod 644 /usr/local/etc/xray/users.json

    log "Xray configured"

    # Start Xray
    echo "Starting Xray..."
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

    # Firewall
    echo "Configuring firewall..."
    ufw allow 443/tcp
    ufw --force enable
    log "Firewall configured"

    # Save installation info
    SERVER_IP=$(curl -s --max-time 5 ifconfig.me 2>/dev/null || echo "Unknown")
    cat > /root/proxy-installation-info.txt <<EOF
Installation Details
====================
Date: $(date)
Layer: 7 (V2Ray VLESS)
Port: 443
Protocol: VLESS + WebSocket + TLS
Script Version: $SCRIPT_VERSION

Server IP: $SERVER_IP
UUID: $UUID
WebSocket Path: $WS_PATH

Config Location: /usr/local/etc/xray/config.json
Users Database: /usr/local/etc/xray/users.json
EOF

    touch "$LOG_FILE"

    log "=== Layer 7 VLESS installation completed ==="

    # Final output
    echo ""
    echo "============================================"
    echo " ✓ Installation Complete!"
    echo "============================================"
    echo ""
    echo "V2Ray VLESS proxy is now active on port 443"
    echo ""
    echo "Connection Details:"
    echo "-------------------"
    echo "Server IP: $SERVER_IP"
    echo "Port: 443"
    echo "UUID: $UUID"
    echo "Path: $WS_PATH"
    echo "TLS: Enabled (self-signed)"
    echo "Protocol: VLESS"
    echo "Transport: WebSocket"
    echo ""
    echo "Client Configuration (JSON):"
    echo "----------------------------"
    cat <<CLIENTEOF
{
  "outbounds": [{
    "protocol": "vless",
    "settings": {
      "vnext": [{
        "address": "$SERVER_IP",
        "port": 443,
        "users": [{"id": "$UUID", "encryption": "none"}]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "security": "tls",
      "tlsSettings": {"allowInsecure": true},
      "wsSettings": {"path": "$WS_PATH"}
    }
  }]
}
CLIENTEOF
    echo ""
    echo "Management commands:"
    echo "  systemctl status xray  - Check Xray status"
    echo "  bash status.sh         - System status"
    echo "  bash backup-config.sh  - Backup configuration"
    echo "  bash uninstall.sh      - Uninstall completely"
    echo ""
    echo "Note: Save the UUID and path - you'll need them to connect!"
    echo "      They are also saved in: /root/proxy-installation-info.txt"
    echo ""
    echo "============================================"
}

trap 'log "ERROR: Installation failed at line $LINENO"; exit 1' ERR
main "$@"
