# راهنمای اتصال با macOS - لایه ۳ (SSH پایه)

[← بازگشت به راهنمای اصلی لایه ۳](./README.md)

---

## مرحله ۱: باز کردن Terminal

از Spotlight (Cmd+Space) جستجو کنید: **Terminal**

---

## مرحله ۲: اتصال SSH با SOCKS Proxy

دستور زیر را اجرا کنید:

```bash
ssh -D 1080 -N username@SERVER-IP -p 22
```

**توجه:**
- `username` را با نام کاربری خود جایگزین کنید
- `SERVER-IP` را با IP سرور خود جایگزین کنید
- پورت `22` برای لایه ۳

مثال:
```bash
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 22
```

رمز عبور را وارد کنید.

پنجره Terminal را باز نگه دارید.

---

## مرحله ۳: تنظیم پراکسی سیستم

### روش ۱: تنظیمات سیستم (System-wide)

1. **System Preferences** → **Network**
2. شبکه فعلی خود را انتخاب کنید (Wi-Fi یا Ethernet)
3. روی **Advanced** کلیک کنید
4. تب **Proxies** را انتخاب کنید
5. **SOCKS Proxy** را تیک بزنید
6. **SOCKS Proxy Server**: `127.0.0.1:1080`
7. روی **OK** و سپس **Apply** کلیک کنید

✅ تمام برنامه‌ها از پراکسی استفاده می‌کنند!

---

### روش ۲: فقط مرورگر (Firefox)

اگر فقط می‌خواهید Firefox از پراکسی استفاده کند:

1. Firefox → **Preferences**
2. **Network Settings** → **Settings**
3. **Manual proxy configuration**
4. **SOCKS Host**: `127.0.0.1`
5. **Port**: `1080`
6. **SOCKS v5** را انتخاب کنید
7. روی **OK** کلیک کنید

---

### روش ۳: Chrome با افزونه

برای Chrome از افزونه **Proxy SwitchyOmega** استفاده کنید:

1. نصب از Chrome Web Store
2. New Profile → Proxy Profile
3. Protocol: SOCKS5
4. Server: `127.0.0.1`
5. Port: `1080`

---

## نکات مهم

- پنجره Terminal باید باز بماند
- اگر Terminal را ببندید، پراکسی قطع می‌شود
- برای قطع اتصال: Ctrl+C در Terminal
- پورت `1080` باید آزاد باشد

---

## نکته پیشرفته: اجرای در Background

اگر می‌خواهید بدون باز نگه داشتن Terminal اجرا شود:

```bash
ssh -D 1080 -N -f username@SERVER-IP -p 22
```

پارامتر `-f` باعث می‌شود SSH در background اجرا شود.

برای قطع اتصال:
```bash
ps aux | grep "ssh -D 1080"
kill [PID]
```

---

=====================================================================

# macOS Connection Guide - Layer 3 (Basic SSH)

[← Back to Layer 3 Main Guide](./README.md)

---

## Step 1: Open Terminal

From Spotlight (Cmd+Space) search: **Terminal**

---

## Step 2: Connect SSH with SOCKS Proxy

Run this command:

```bash
ssh -D 1080 -N username@SERVER-IP -p 22
```

**Note:**
- Replace `username` with your username
- Replace `SERVER-IP` with your server IP
- Port `22` for Layer 3

Example:
```bash
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 22
```

Enter your password.

Keep the Terminal window open.

---

## Step 3: Configure Proxy Settings

### Method 1: System Settings (System-wide)

1. **System Preferences** → **Network**
2. Select your current network (Wi-Fi or Ethernet)
3. Click **Advanced**
4. Select **Proxies** tab
5. Check **SOCKS Proxy**
6. **SOCKS Proxy Server**: `127.0.0.1:1080`
7. Click **OK** then **Apply**

✅ All apps will use the proxy!

---

### Method 2: Browser Only (Firefox)

If you want only Firefox to use the proxy:

1. Firefox → **Preferences**
2. **Network Settings** → **Settings**
3. **Manual proxy configuration**
4. **SOCKS Host**: `127.0.0.1`
5. **Port**: `1080`
6. Select **SOCKS v5**
7. Click **OK**

---

### Method 3: Chrome with Extension

For Chrome, use **Proxy SwitchyOmega** extension:

1. Install from Chrome Web Store
2. New Profile → Proxy Profile
3. Protocol: SOCKS5
4. Server: `127.0.0.1`
5. Port: `1080`

---

## Important Notes

- Terminal window must remain open
- If you close Terminal, proxy will disconnect
- To disconnect: Ctrl+C in Terminal
- Port `1080` must be free

---

## Advanced Tip: Run in Background

If you want to run without keeping Terminal open:

```bash
ssh -D 1080 -N -f username@SERVER-IP -p 22
```

The `-f` parameter makes SSH run in background.

To disconnect:
```bash
ps aux | grep "ssh -D 1080"
kill [PID]
```

---

**Made with ❤️ for internet freedom**
