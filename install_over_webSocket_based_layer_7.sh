#!/bin/bash
set -e

echo "=== FINAL OPTION A: Dedicated SSH Bridge on 443 ==="
echo "!!! Apache / Plesk WILL BE DISABLED !!!"
sleep 2

# --------------------------------------------------
# 1. STOP & DISABLE APACHE (FREE 443)
# --------------------------------------------------
if systemctl is-active --quiet apache2; then
  systemctl stop apache2
fi

systemctl disable apache2 || true
systemctl mask apache2 || true

# Kill any remaining apache processes
pkill -9 apache2 || true

# --------------------------------------------------
# 2. UPDATE & INSTALL REQUIRED PACKAGES
# --------------------------------------------------
apt update && apt upgrade -y
apt install -y openssh-server nginx-extras ufw

# --------------------------------------------------
# 3. SSH CONFIG (SOCKS SUPPORT)
# --------------------------------------------------
SSHD_CONFIG="/etc/ssh/sshd_config"

grep -q "^AllowTcpForwarding yes" "$SSHD_CONFIG" || echo "AllowTcpForwarding yes" >> "$SSHD_CONFIG"
grep -q "^PermitTunnel no" "$SSHD_CONFIG" || echo "PermitTunnel no" >> "$SSHD_CONFIG"
grep -q "^X11Forwarding no" "$SSHD_CONFIG" || echo "X11Forwarding no" >> "$SSHD_CONFIG"

systemctl enable ssh
systemctl restart ssh

# --------------------------------------------------
# 4. CLEAN NGINX CONFIG (REMOVE OLD STREAM LOADS)
# --------------------------------------------------
NGINX_CONF="/etc/nginx/nginx.conf"
sed -i '/ngx_stream_module.so/d' "$NGINX_CONF"

# --------------------------------------------------
# 5. CREATE STREAM CONFIG
# --------------------------------------------------
mkdir -p /etc/nginx/stream.d

cat > /etc/nginx/stream.d/ssh_443.conf <<'EOF'
server {
    listen 443;
    proxy_pass 127.0.0.1:22;
    proxy_timeout 1h;
    proxy_connect_timeout 10s;
}
EOF

# --------------------------------------------------
# 6. ENSURE STREAM BLOCK EXISTS
# --------------------------------------------------
if ! grep -q "^stream {" "$NGINX_CONF"; then
  sed -i '/http {/i stream {\n    include /etc/nginx/stream.d/*.conf;\n}\n' "$NGINX_CONF"
fi

# --------------------------------------------------
# 7. FIREWALL
# --------------------------------------------------
ufw allow 443/tcp
ufw allow 22/tcp
ufw --force enable

# --------------------------------------------------
# 8. START NGINX
# --------------------------------------------------
nginx -t
systemctl enable nginx
systemctl restart nginx

# --------------------------------------------------
# DONE
# --------------------------------------------------
echo "=============================================="
echo " ✅ Apache / Plesk DISABLED"
echo " ✅ SSH BRIDGE ACTIVE ON PORT 443"
echo " ✅ Use: ssh -p 443 -D 1080 user@SERVER_IP"
echo "=============================================="
