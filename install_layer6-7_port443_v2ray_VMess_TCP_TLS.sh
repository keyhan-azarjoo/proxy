#!/bin/bash
set -e

echo "=== FINAL: Xray (V2Ray) — VMess + TCP + TLS (NPV Tunnel Compatible) ==="
echo "This server will act as a free internet bridge"
sleep 2

# --------------------------------------------------
# 0. CLEAN UP OLD / CONFLICTING SERVICES
# --------------------------------------------------
systemctl stop stunnel4 nginx apache2 plesk psa sw-cp-server sw-engine 2>/dev/null || true
systemctl disable stunnel4 nginx apache2 plesk psa sw-cp-server sw-engine 2>/dev/null || true
systemctl mask stunnel4 nginx apache2 plesk psa sw-cp-server sw-engine 2>/dev/null || true

apt purge -y stunnel4 nginx apache2 || true
rm -rf /etc/stunnel

# --------------------------------------------------
# 1. UPDATE & INSTALL DEPENDENCIES
# --------------------------------------------------
apt update -y
apt install -y curl unzip openssl ufw

# --------------------------------------------------
# 2. INSTALL XRAY (OFFICIAL)
# --------------------------------------------------
bash <(curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh)

# --------------------------------------------------
# 3. GENERATE UUID
# --------------------------------------------------
UUID=$(cat /proc/sys/kernel/random/uuid)

echo ""
echo "Generated UUID : $UUID"
echo ""

# --------------------------------------------------
# 4. CREATE TLS CERTIFICATE (SELF-SIGNED)
# --------------------------------------------------
mkdir -p /etc/xray/certs

openssl req -new -x509 -nodes -days 3650 \
  -keyout /etc/xray/certs/private.key \
  -out /etc/xray/certs/cert.pem \
  -subj "/C=US/ST=Internet/L=Internet/O=Cloudflare/OU=Web/CN=cloudflare.com"

# --------------------------------------------------
# 5. FIX PERMISSIONS (CRITICAL)
# --------------------------------------------------
chmod 755 /usr /usr/local /usr/local/etc
mkdir -p /usr/local/etc/xray
chmod 755 /usr/local/etc/xray

chown -R nobody:nogroup /etc/xray
chown -R nobody:nogroup /usr/local/etc/xray

chmod 644 /etc/xray/certs/cert.pem
chmod 644 /etc/xray/certs/private.key

# --------------------------------------------------
# 6. XRAY CONFIG — VMESS + TCP + TLS
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
      "protocol": "vmess",
      "settings": {
        "clients": [
          {
            "id": "$UUID",
            "alterId": 0
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "tls",
        "tlsSettings": {
          "certificates": [
            {
              "certificateFile": "/etc/xray/certs/cert.pem",
              "keyFile": "/etc/xray/certs/private.key"
            }
          ]
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
# 7. START XRAY
# --------------------------------------------------
systemctl daemon-reload
systemctl enable xray
systemctl restart xray

# --------------------------------------------------
# 8. FIREWALL
# --------------------------------------------------
ufw allow 443/tcp
ufw --force enable

 systemctl status xray --no-pager
 
echo "=============================================="
echo " ✅ Xray is RUNNING"
echo " ✅ Protocol: VMess + TCP + TLS"
echo ""
echo " Server IP : $(curl -s ifconfig.me)"
echo " Port      : 443"
echo " UUID      : $UUID"
echo " AlterId   : 0"
echo " TLS SNI   : cloudflare.com"
echo "=============================================="



# # --------------------------------------------------
# # 9. GENERATE CLIENT V2RAY JSON (NPV TUNNEL)
# # --------------------------------------------------
# SERVER_IP=$(curl -s ifconfig.me)
# CLIENT_JSON="/root/npv_v2ray_client.json"
# 
# cat > "$CLIENT_JSON" <<EOF
# {
#   "inbounds": [],
#   "outbounds": [
#     {
#       "protocol": "vmess",
#       "settings": {
#         "vnext": [
#           {
#             "address": "$SERVER_IP",
#             "port": 443,
#             "users": [
#               {
#                 "id": "$UUID",
#                 "alterId": 0,
#                 "security": "auto"
#               }
#             ]
#           }
#         ]
#       },
#       "streamSettings": {
#         "network": "tcp",
#         "security": "tls",
#         "tlsSettings": {
#           "serverName": "cloudflare.com",
#           "allowInsecure": true
#         }
#       }
#     }
#   ]
# }
# EOF
# 
# chmod 600 "$CLIENT_JSON"
# 
# echo ""
# echo "=============================================="
# echo " 📄 CLIENT CONFIG GENERATED"
# echo " File: $CLIENT_JSON"
# echo "=============================================="
# echo ""
# echo "------ COPY BELOW INTO NPV TUNNEL ------"
# cat "$CLIENT_JSON"
# echo "----------------------------------------"

# --------------------------------------------------
# DONE
# --------------------------------------------------
