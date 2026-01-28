# راهنمای اتصال با macOS - لایه ۴ (Nginx)

[← بازگشت به راهنمای اصلی لایه ۴](./README.md)

---

## مرحله ۱: باز کردن Terminal

از Spotlight (Cmd+Space) جستجو کنید: **Terminal**

---

## مرحله ۲: اتصال SSH با SOCKS Proxy

دستور زیر را اجرا کنید:

```bash
ssh -D 1080 -N username@SERVER-IP -p 443
```

**توجه:**
- `username` را با نام کاربری خود جایگزین کنید
- `SERVER-IP` را با IP سرور خود جایگزین کنید
- پورت `443` برای لایه ۴ (HTTPS)

مثال:
```bash
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 443
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
- پورت **443** شبیه HTTPS است و فیلتر شدن آن سخت‌تر است
- این روش برای استفاده روزمره توصیه می‌شود

---

## نکته پیشرفته: اجرای در Background

```bash
ssh -D 1080 -N -f username@SERVER-IP -p 443
```

---

=====================================================================

# macOS Connection Guide - Layer 4 (Nginx)

[← Back to Layer 4 Main Guide](./README.md)

---

## Step 1: Open Terminal

From Spotlight (Cmd+Space) search: **Terminal**

---

## Step 2: Connect SSH with SOCKS Proxy

Run this command:

```bash
ssh -D 1080 -N username@SERVER-IP -p 443
```

**Note:**
- Replace `username` with your username
- Replace `SERVER-IP` with your server IP
- Port `443` for Layer 4 (HTTPS)

Example:
```bash
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 443
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
- Port **443** looks like HTTPS and is harder to filter
- This method is recommended for daily use

---

## Advanced Tip: Run in Background

```bash
ssh -D 1080 -N -f username@SERVER-IP -p 443
```

---

**Made with ❤️ for internet freedom**
