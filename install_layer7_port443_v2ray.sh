#!/bin/bash
set -e

echo "=== FINAL: Xray (V2Ray) — Layer 7 VLESS + WS + TLS on 443 ==="
echo "This server will be a dedicated free-internet bridge"
sleep 2

# --------------------------------------------------
# 0. REMOVE Layer-6 leftovers (stunnel)
# --------------------------------------------------
systemctl stop stunnel4 2>/dev/null || true
systemctl disable stunnel4 2>/dev/null || true
apt purge -y stunnel4 || true
rm -rf /etc/stunnel

# --------------------------------------------------
# 1. FREE PORT 443 (Plesk / Web stack)
# --------------------------------------------------
for svc in nginx apache2 httpd plesk psa sw-cp-server sw-engine; do
  systemctl stop $svc 2>/dev/null || true
  systemctl disable $svc 2>/dev/null || true
  systemctl mask $svc 2>/dev/null || true
done

# --------------------------------------------------
# 2. SYSTEM UPDATE + DEPENDENCIES
# --------------------------------------------------
apt update -y
apt install -y curl unzip openssl ufw

# --------------------------------------------------
# 3. INSTALL XRAY (OFFICIAL)
# --------------------------------------------------
bash <(curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh)

# --------------------------------------------------
# 4. GENERATE UUID + WS PATH
# --------------------------------------------------
UUID=$(cat /proc/sys/kernel/random/uuid)
WS_PATH="/freeinternet"

echo ""
echo "Generated UUID : $UUID"
echo "WebSocket Path : $WS_PATH"
echo ""

# --------------------------------------------------
# 5. CREATE TLS CERTIFICATE
# --------------------------------------------------
mkdir -p /etc/xray/certs

openssl req -new -x509 -nodes -days 3650 \
  -keyout /etc/xray/certs/private.key \
  -out /etc/xray/certs/cert.pem \
  -subj "/C=US/ST=Internet/L=Internet/O=Cloudflare/OU=Web/CN=cloudflare.com"

# --------------------------------------------------
# 6. FIX *ALL* PERMISSIONS (CRITICAL)
# --------------------------------------------------
chmod 755 /usr
chmod 755 /usr/local
chmod 755 /usr/local/etc
mkdir -p /usr/local/etc/xray
chmod 755 /usr/local/etc/xray

chown -R nobody:nogroup /etc/xray
chown -R nobody:nogroup /usr/local/etc/xray

chmod 644 /etc/xray/certs/cert.pem
chmod 644 /etc/xray/certs/private.key

# --------------------------------------------------
# 7. XRAY CONFIG (VLESS + WS + TLS)
# --------------------------------------------------
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

# --------------------------------------------------
# 8. START XRAY
# --------------------------------------------------
systemctl daemon-reload
systemctl enable xray
systemctl restart xray

# --------------------------------------------------
# 9. FIREWALL
# --------------------------------------------------
ufw allow 443/tcp
ufw --force enable

# --------------------------------------------------
# DONE
# --------------------------------------------------
systemctl status xray --no-pager
echo "=============================================="
echo " ✅ Xray is RUNNING (Layer 7)"
echo " ✅ Protocol: VLESS + WebSocket + TLS"
echo ""
echo " Server IP : $(curl -s ifconfig.me)"
echo " Port      : 443"
echo " UUID      : $UUID"
echo " Path      : $WS_PATH"
echo " TLS SNI   : cloudflare.com"
echo "=============================================="
