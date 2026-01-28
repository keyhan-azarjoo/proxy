#!/bin/bash
set -e

if [ "$#" -ne 1 ]; then
  echo "Usage: delete-user.sh <username>"
  exit 1
fi

USERNAME="$1"
SSHD_CONFIG="/etc/ssh/sshd_config"

echo "Deleting user: $USERNAME"

# Check user exists
if ! id "$USERNAME" &>/dev/null; then
  echo "User $USERNAME does not exist"
  exit 0
fi

echo "Killing active processes for $USERNAME..."
pkill -u "$USERNAME" || true
sleep 1

echo "Removing user account..."
deluser --remove-home "$USERNAME"

# Get existing Match User list
EXISTING_USERS=$(grep "^Match User" "$SSHD_CONFIG" | sed 's/Match User //')

# Remove old Match User block
sed -i '/^Match User /,$d' "$SSHD_CONFIG"

# Remove deleted user from list
UPDATED_USERS=$(echo "$EXISTING_USERS" | tr ',' '\n' | grep -v "^$USERNAME$" | tr '\n' ',' | sed 's/,$//')

# Rebuild Match User block if users remain
if [ -n "$UPDATED_USERS" ]; then
cat <<EOF >> "$SSHD_CONFIG"

Match User $UPDATED_USERS
    AllowTcpForwarding yes
    X11Forwarding no
    PermitTunnel no
    PermitTTY no
    ForceCommand echo "SSH SOCKS proxy only"
EOF
fi

systemctl restart ssh

echo "======================================"
echo " User $USERNAME deleted successfully"
echo "======================================"
