#!/bin/bash
set -e

echo "=== Layer 7 INSTALL (FREE DOMAIN AUTO) ==="

# -----------------------------
# USER INPUT
# -----------------------------
read -p "Enter DuckDNS subdomain (example: mybridge): " SUBDOMAIN
read -p "Enter DuckDNS token: " TOKEN

DOMAIN="${SUBDOMAIN}.duckdns.org"
IP=$(curl -s https://api.ipify.org)

echo "Using domain: $DOMAIN"
echo "Server IP: $IP"
sleep 2

# -----------------------------
# UPDATE SYSTEM
# -----------------------------
apt update && apt upgrade -y

# -----------------------------
# INSTALL PACKAGES
# -----------------------------
apt install -y \
  nginx \
  openssh-server \
  certbot \
  python3-certbot-nginx \
  ufw \
  curl

# -----------------------------
# REGISTER DOMAIN (DuckDNS)
# -----------------------------
echo "Registering DuckDNS domain..."
curl "https://www.duckdns.org/update?domains=$SUBDOMAIN&token=$TOKEN&ip=$IP"

# -----------------------------
# SSH (LOCAL ONLY)
# -----------------------------
SSHD_CONFIG="/etc/ssh/sshd_config"

sed -i '/^Port /d' "$SSHD_CONFIG"
sed -i '/^ListenAddress /d' "$SSHD_CONFIG"

cat <<EOF >> "$SSHD_CONFIG"
Port 2222
ListenAddress 127.0.0.1
AllowTcpForwarding yes
PermitTTY no
X11Forwarding no
EOF

systemctl restart ssh

# -----------------------------
# FIREWALL
# -----------------------------
ufw allow 443/tcp
ufw --force enable

# -----------------------------
# TEMP NGINX (HTTP)
# -----------------------------
cat > /etc/nginx/sites-available/ssh-ws <<EOF
server {
    listen 80;
    server_name $DOMAIN;

    location / {
        root /var/www/html;
        index index.html;
    }
}
EOF

ln -sf /etc/nginx/sites-available/ssh-ws /etc/nginx/sites-enabled/ssh-ws
rm -f /etc/nginx/sites-enabled/default

nginx -t
systemctl restart nginx

# -----------------------------
# HTTPS CERT (FREE)
# -----------------------------
certbot --nginx -d "$DOMAIN" \
  --agree-tos \
  --register-unsafely-without-email \
  --non-interactive

# -----------------------------
# FINAL NGINX (LAYER 7)
# -----------------------------
cat > /etc/nginx/sites-available/ssh-ws <<EOF
server {
    listen 443 ssl http2;
    server_name $DOMAIN;

    ssl_certificate     /etc/letsencrypt/live/$DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$DOMAIN/privkey.pem;

    location / {
        root /var/www/html;
        index index.html;
    }

    location /ws {
        proxy_pass http://127.0.0.1:2222;
        proxy_http_version 1.1;

        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host \$host;

        proxy_read_timeout 86400;
    }
}
EOF

nginx -t
systemctl restart nginx

echo "========================================"
echo " ✅ LAYER 7 READY (FREE DOMAIN)"
echo " Domain : $DOMAIN"
echo " Port   : 443"
echo " Path   : /ws"
echo "========================================"
