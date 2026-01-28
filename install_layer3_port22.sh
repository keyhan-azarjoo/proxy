#!/bin/bash
set -e
SSHD_CONFIG="/etc/ssh/sshd_config"
echo "=== Installing SSH SOCKS Proxy Base ==="

apt update && apt upgrade -y
apt install -y openssh-server
systemctl enable ssh
systemctl start ssh

# Ensure required global SSH options
grep -q "^AllowTcpForwarding yes" "$SSHD_CONFIG" || echo "AllowTcpForwarding yes" >> "$SSHD_CONFIG"
grep -q "^PermitTunnel no" "$SSHD_CONFIG" || echo "PermitTunnel no" >> "$SSHD_CONFIG"

# Remove any existing Match User block
sed -i '/^Match User /,$d' "$SSHD_CONFIG"

systemctl restart ssh
ufw allow 22
ufw --force enable

echo "======================================"
echo " SSH SOCKS PROXY INSTALLED"
echo " Now use add-user.sh to add users"
echo "======================================"
