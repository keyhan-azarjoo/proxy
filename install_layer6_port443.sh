#!/bin/bash
set -e

echo "=== FINAL LAYER 6: SSH over TLS (stunnel on 443) ==="
echo "Dedicated Internet Bridge Mode"
sleep 2

# --------------------------------------------------
# 1. STOP & MASK SERVICES THAT USE 443
# --------------------------------------------------
for svc in nginx apache2 httpd plesk psa sw-cp-server sw-engine; do
  systemctl stop $svc 2>/dev/null || true
  systemctl disable $svc 2>/dev/null || true
  systemctl mask $svc 2>/dev/null || true
done

# --------------------------------------------------
# 2. UPDATE & INSTALL PACKAGES
# --------------------------------------------------
apt update -y
apt install -y openssh-server stunnel4 openssl ufw

# --------------------------------------------------
# 3. SSH CONFIG (SOCKS SUPPORT)
# --------------------------------------------------
SSHD_CONFIG="/etc/ssh/sshd_config"

grep -q "^AllowTcpForwarding yes" "$SSHD_CONFIG" || echo "AllowTcpForwarding yes" >> "$SSHD_CONFIG"
grep -q "^PermitTunnel no" "$SSHD_CONFIG" || echo "PermitTunnel no" >> "$SSHD_CONFIG"
grep -q "^X11Forwarding no" "$SSHD_CONFIG" || echo "X11Forwarding no" >> "$SSHD_CONFIG"

systemctl restart ssh

# --------------------------------------------------
# 4. CREATE STUNNEL CERT
# --------------------------------------------------
mkdir -p /etc/stunnel

openssl req -new -x509 -nodes -days 3650 \
  -keyout /etc/stunnel/stunnel.pem \
  -out /etc/stunnel/stunnel.pem \
  -subj "/C=US/ST=CA/L=Internet/O=Cloudflare/OU=Security/CN=cloudflare.com"

chmod 600 /etc/stunnel/stunnel.pem

# --------------------------------------------------
# 5. STUNNEL CONFIG (CRITICAL)
# --------------------------------------------------
cat > /etc/stunnel/stunnel.conf <<'EOF'
pid = /var/run/stunnel.pid
output = /var/log/stunnel.log
foreground = no
client = no

[ssh-tls]
accept = 443
connect = 127.0.0.1:22
cert = /etc/stunnel/stunnel.pem
EOF

# --------------------------------------------------
# 6. ENABLE STUNNEL (CORRECT WAY FOR 24.04)
# --------------------------------------------------
sed -i 's/^ENABLED=.*/ENABLED=1/' /etc/default/stunnel4

# Start using SysV (NOT systemctl enable)
service stunnel4 restart

# Ensure auto-start on reboot (cron fallback)
CRON_JOB="@reboot /usr/bin/service stunnel4 restart"
(crontab -l 2>/dev/null | grep -v stunnel4; echo "$CRON_JOB") | crontab -

# --------------------------------------------------
# 7. FIREWALL
# --------------------------------------------------
ufw allow 443/tcp
ufw allow 22/tcp
ufw --force enable

# --------------------------------------------------
# DONE
# --------------------------------------------------
echo "=============================================="
echo " ✅ Layer 6 ACTIVE: SSH over TLS"
echo " ✅ Port 443 owned by stunnel"
echo " ✅ Auto-start ensured"
echo " ✅ Use SSH + SSL in NPV Tunnel"
echo "=============================================="
