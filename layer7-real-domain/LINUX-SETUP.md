# راهنمای اتصال با Linux - لایه ۷ (دامنه واقعی + TLS)

[← بازگشت به راهنمای اصلی لایه ۷](./README.md)

---

## روش ۱: استفاده از Xray-core

### مرحله ۱: نصب

```bash
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
```

### مرحله ۲: ایجاد کانفیگ

```bash
sudo nano /usr/local/etc/xray/config.json
```

محتوا (برای VLESS):
```json
{
  "inbounds": [{
    "port": 1080,
    "protocol": "socks",
    "settings": {"udp": true}
  }],
  "outbounds": [{
    "protocol": "vless",
    "settings": {
      "vnext": [{
        "address": "your-domain.duckdns.org",
        "port": 443,
        "users": [{
          "id": "YOUR-UUID",
          "encryption": "none"
        }]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "security": "tls",
      "tlsSettings": {
        "serverName": "your-domain.duckdns.org"
      },
      "wsSettings": {
        "path": "/vless"
      }
    }
  }]
}
```

### مرحله ۳: اجرا

```bash
sudo systemctl start xray
sudo systemctl enable xray
```

### مرحله ۴: تنظیم پراکسی

```bash
export ALL_PROXY=socks5://127.0.0.1:1080
```

---

## روش ۲: استفاده از Qv2ray (GUI)

### نصب:
```bash
wget https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/qv2ray_2.7.0_amd64.deb
sudo dpkg -i qv2ray_2.7.0_amd64.deb
```

### اضافه کردن:
Group → Import → From VLESS/Trojan link / QR code

✅ اتصال برقرار شد!

---

## نکات مهم

- این روش بهترین امنیت را دارد
- استفاده از دامنه واقعی + گواهی TLS معتبر
- ترافیک شبیه HTTPS واقعی است

---

=====================================================================

# Linux Connection Guide - Layer 7 (Real Domain + TLS)

[← Back to Layer 7 Main Guide](./README.md)

---

## Method 1: Using Xray-core

### Step 1: Installation

```bash
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install
```

### Step 2: Create Config

```bash
sudo nano /usr/local/etc/xray/config.json
```

Content (for VLESS):
```json
{
  "inbounds": [{
    "port": 1080,
    "protocol": "socks",
    "settings": {"udp": true}
  }],
  "outbounds": [{
    "protocol": "vless",
    "settings": {
      "vnext": [{
        "address": "your-domain.duckdns.org",
        "port": 443,
        "users": [{
          "id": "YOUR-UUID",
          "encryption": "none"
        }]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "security": "tls",
      "tlsSettings": {
        "serverName": "your-domain.duckdns.org"
      },
      "wsSettings": {
        "path": "/vless"
      }
    }
  }]
}
```

### Step 3: Run

```bash
sudo systemctl start xray
sudo systemctl enable xray
```

### Step 4: Configure Proxy

```bash
export ALL_PROXY=socks5://127.0.0.1:1080
```

---

## Method 2: Using Qv2ray (GUI)

### Install:
```bash
wget https://github.com/Qv2ray/Qv2ray/releases/download/v2.7.0/qv2ray_2.7.0_amd64.deb
sudo dpkg -i qv2ray_2.7.0_amd64.deb
```

### Add:
Group → Import → From VLESS/Trojan link / QR code

✅ Connected successfully!

---

## Important Notes

- This method has the best security
- Uses real domain + valid TLS certificate
- Traffic looks like real HTTPS

---

**Made with ❤️ for internet freedom**
