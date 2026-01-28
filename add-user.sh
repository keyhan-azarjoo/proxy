#!/bin/bash
set -e

if [ "$#" -ne 2 ]; then
  echo "Usage: add-user.sh <username> <password>"
  exit 1
fi

USERNAME="$1"
PASSWORD="$2"
SSHD_CONFIG="/etc/ssh/sshd_config"
USER_SHELL="/usr/sbin/nologin"

echo "Adding SOCKS-only user: $USERNAME"

# Create user if not exists
if ! id "$USERNAME" &>/dev/null; then
  useradd -m -s "$USER_SHELL" "$USERNAME"
  echo "$USERNAME:$PASSWORD" | chpasswd
  echo "User created"
else
  echo "User already exists"
fi

# Remove existing Match block for this user (if any)
sed -i "/^Match User $USERNAME$/,/^$/d" "$SSHD_CONFIG"

# Append clean Match block
cat <<EOF >> "$SSHD_CONFIG"

Match User $USERNAME
    AllowTcpForwarding yes
    X11Forwarding no
    PermitTunnel no
    PermitTTY no
    ForceCommand /usr/bin/true
EOF

systemctl restart ssh

echo "======================================"
echo " SOCKS-only user '$USERNAME' added"
echo "======================================"
