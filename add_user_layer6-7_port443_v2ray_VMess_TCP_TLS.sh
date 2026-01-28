#!/bin/bash
set -e

USERNAME="$1"

if [ -z "$USERNAME" ]; then
  echo "Usage: add-user.sh <username>"
  exit 1
fi

command -v jq >/dev/null 2>&1 || {
  apt update -y && apt install -y jq
}

CONFIG="/usr/local/etc/xray/config.json"
SERVER_IP=$(curl -s ifconfig.me)
USER_DB="/usr/local/etc/xray/users.json"

mkdir -p /usr/local/etc/xray
touch "$USER_DB"

# --------------------------------------------
# Load or create user
# --------------------------------------------
if jq -e --arg u "$USERNAME" '.[$u]' "$USER_DB" >/dev/null 2>&1; then
  UUID=$(jq -r --arg u "$USERNAME" '.[$u]' "$USER_DB")
  EXISTING=true
else
  UUID=$(cat /proc/sys/kernel/random/uuid)
  jq --arg u "$USERNAME" --arg id "$UUID" '. + {($u): $id}' "$USER_DB" > /tmp/users.json
  mv /tmp/users.json "$USER_DB"

  jq --arg uuid "$UUID" \
    '.inbounds[0].settings.clients += [{"id":$uuid,"alterId":0}]' \
    "$CONFIG" > /tmp/xray.json

  mv /tmp/xray.json "$CONFIG"
  systemctl restart xray
  EXISTING=false
fi

# --------------------------------------------
# Print JSON for NPV Tunnel
# --------------------------------------------
echo "===================================="
echo " User     : $USERNAME"
echo " UUID     : $UUID"
if [ "$EXISTING" = true ]; then
  echo " Status   : Existing user"
else
  echo " Status   : New user created"
fi
echo "===================================="
echo ""
echo "========== COPY THIS INTO NPV TUNNEL =========="
echo ""

cat <<EOF
{
  "inbounds": [],
  "outbounds": [
    {
      "protocol": "vmess",
      "settings": {
        "vnext": [
          {
            "address": "$SERVER_IP",
            "port": 443,
            "users": [
              {
                "id": "$UUID",
                "alterId": 0,
                "security": "auto"
              }
            ]
          }
        ]
      },
      "streamSettings": {
        "network": "tcp",
        "security": "tls",
        "tlsSettings": {
          "serverName": "cloudflare.com",
          "allowInsecure": true
        }
      }
    }
  ]
}
EOF

echo ""
echo "=============================================="
