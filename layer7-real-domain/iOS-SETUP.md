# راهنمای اتصال با iOS - لایه ۷ (دامنه واقعی + TLS)

[← بازگشت به راهنمای اصلی لایه ۷](./README.md)

---

## اپلیکیشن‌های مورد نیاز

دو گزینه دارید:
- **V2Box** (رایگان در App Store)
- **Shadowrocket** (پولی ولی بهتر)

---

## مرحله ۱: نصب اپلیکیشن

وارد **App Store** شوید و یکی از این دو را نصب کنید:
- V2Box (توصیه برای شروع)
- Shadowrocket

---

## مرحله ۲: دریافت لینک یا QR Code

بعد از نصب سرور، یکی از این را دریافت کرده‌اید:
- **لینک VLESS/Trojan** (vless://... یا trojan://...)
- **QR Code**

این لینک شامل دامنه واقعی شما (مثل myproxy.duckdns.org) است.

---

## مرحله ۳: اضافه کردن کانفیگ

### روش ۱: اسکن QR Code (راحت‌تر)

1. در اپلیکیشن روی **+** یا **Scan** بزنید
2. QR Code نمایش داده شده در سرور را اسکن کنید
3. کانفیگ به‌طور خودکار اضافه می‌شود

### روش ۲: کپی لینک

1. لینک VLESS/Trojan را کپی کنید
2. در اپلیکیشن **Paste from Clipboard** یا **Import from Clipboard** را بزنید
3. کانفیگ اضافه می‌شود

---

## مرحله ۴: اتصال

روی کانفیگ کلیک کنید و **Connect** بزنید.

✅ اتصال برقرار شد!

---

## نکات مهم

- این روش بهترین امنیت و مخفی‌سازی را دارد
- استفاده از دامنه واقعی + گواهی TLS معتبر
- ترافیک دقیقاً شبیه HTTPS واقعی است
- برای سانسور بسیار سخت طراحی شده
- UUID و لینک را ایمن نگه دارید

---

=====================================================================

# iOS Connection Guide - Layer 7 (Real Domain + TLS)

[← Back to Layer 7 Main Guide](./README.md)

---

## Required Apps

You have two options:
- **V2Box** (Free on App Store)
- **Shadowrocket** (Paid but better)

---

## Step 1: Install App

Go to **App Store** and install one of these:
- V2Box (recommended for beginners)
- Shadowrocket

---

## Step 2: Get Link or QR Code

After server installation, you received one of these:
- **VLESS/Trojan link** (vless://... or trojan://...)
- **QR Code**

This link includes your real domain (like myproxy.duckdns.org).

---

## Step 3: Add Configuration

### Method 1: Scan QR Code (easier)

1. In the app, tap **+** or **Scan**
2. Scan the QR code shown on the server
3. Config is added automatically

### Method 2: Copy Link

1. Copy the VLESS/Trojan link
2. In the app, tap **Paste from Clipboard** or **Import from Clipboard**
3. Config is added

---

## Step 4: Connect

Tap on the config and tap **Connect**.

✅ Connected successfully!

---

## Important Notes

- This method has the best security and obfuscation
- Uses real domain + valid TLS certificate
- Traffic looks exactly like real HTTPS
- Designed for very hard censorship
- Keep UUID and link secure

---

**Made with ❤️ for internet freedom**
