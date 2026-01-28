# راهنمای اتصال با Windows - لایه ۷ (V2Ray VMess)

[← بازگشت به راهنمای اصلی لایه ۷](./README.md)

---

## روش ۱: استفاده از V2RayN (ساده‌تر)

### مرحله ۱: دانلود V2RayN

از لینک زیر دانلود کنید:
https://github.com/2dust/v2rayN/releases

فایل `v2rayN-windows-64.zip` را دانلود کنید.

### مرحله ۲: استخراج و اجرا

1. فایل zip را استخراج کنید
2. `v2rayN.exe` را اجرا کنید

### مرحله ۳: اضافه کردن سرور

#### روش A: اسکن QR Code
1. Servers → Scan QRcode from screen
2. QR Code سرور را روی صفحه نمایش دهید

#### روش B: Import از Clipboard
1. لینک VMess را کپی کنید
2. Servers → Import bulk URL from clipboard

### مرحله ۴: اتصال

روی سرور راست کلیک کنید و **Set as active server** را انتخاب کنید.

✅ اتصال برقرار شد!

---

## روش ۲: استفاده از Xray-core (پیشرفته)

### مرحله ۱: دانلود Xray

از لینک زیر دانلود کنید:
https://github.com/XTLS/Xray-core/releases

### مرحله ۲: ایجاد فایل کانفیگ

فایل `config.json` بسازید:

```json
{
  "inbounds": [{
    "port": 1080,
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "SERVER-IP",
        "port": 443,
        "users": [{
          "id": "YOUR-UUID",
          "security": "auto"
        }]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "/vmess"
      }
    }
  }]
}
```

**توجه:** `SERVER-IP` و `YOUR-UUID` را با اطلاعات خود جایگزین کنید.

### مرحله ۳: اجرا

```powershell
.\xray.exe -c config.json
```

### مرحله ۴: تنظیم مرورگر

SOCKS5 proxy: `127.0.0.1:1080`

---

## نکات مهم

- UUID را ایمن نگه دارید
- این روش برای سانسور سخت طراحی شده
- برای استفاده ساده از V2RayN استفاده کنید

---

=====================================================================

# Windows Connection Guide - Layer 7 (V2Ray VMess)

[← Back to Layer 7 Main Guide](./README.md)

---

## Method 1: Using V2RayN (Easier)

### Step 1: Download V2RayN

Download from:
https://github.com/2dust/v2rayN/releases

Download `v2rayN-windows-64.zip`.

### Step 2: Extract and Run

1. Extract the zip file
2. Run `v2rayN.exe`

### Step 3: Add Server

#### Method A: Scan QR Code
1. Servers → Scan QRcode from screen
2. Display the server QR code on screen

#### Method B: Import from Clipboard
1. Copy the VMess link
2. Servers → Import bulk URL from clipboard

### Step 4: Connect

Right-click on the server and select **Set as active server**.

✅ Connected successfully!

---

## Method 2: Using Xray-core (Advanced)

### Step 1: Download Xray

Download from:
https://github.com/XTLS/Xray-core/releases

### Step 2: Create Config File

Create `config.json`:

```json
{
  "inbounds": [{
    "port": 1080,
    "protocol": "socks",
    "settings": {
      "udp": true
    }
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "SERVER-IP",
        "port": 443,
        "users": [{
          "id": "YOUR-UUID",
          "security": "auto"
        }]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "wsSettings": {
        "path": "/vmess"
      }
    }
  }]
}
```

**Note:** Replace `SERVER-IP` and `YOUR-UUID` with your information.

### Step 3: Run

```powershell
.\xray.exe -c config.json
```

### Step 4: Configure Browser

SOCKS5 proxy: `127.0.0.1:1080`

---

## Important Notes

- Keep UUID secure
- This method is designed for hard censorship
- Use V2RayN for simple usage

---

**Made with ❤️ for internet freedom**
