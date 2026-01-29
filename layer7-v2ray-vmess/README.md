# لایه ۷: V2Ray VMess - مخفی‌سازی پیشرفته

> **⭐⭐⭐⭐ برای سانسور سخت**
> پورت 443 - پروتکل VMess با WebSocket

[← بازگشت به راهنمای اصلی](../README.md)

---

## این روش چیست؟

V2Ray با پروتکل VMess - یک پروتکل پیشرفته که ترافیک را به‌طور کامل مخفی می‌کند.
از WebSocket استفاده می‌کند تا دقیقاً شبیه ترافیک وب معمولی باشد.

**مزایا:**
- مخفی‌سازی بسیار پیشرفته
- از سانسور سخت عبور می‌کند
- شبیه ترافیک وب واقعی
- پروتکل VMess قدرتمند

**نسبت به لایه‌های قبلی:**
- سخت‌ترین برای شناسایی
- بهترین برای محیط‌های سانسور سخت
- نصب و تنظیم پیچیده‌تر
- نیاز به کلاینت V2Ray

---

--------------------------------------------------
مرحله ۱: خرید سرور VPS
--------------------------------------------------

**اگر از قبل سرور لینوکس با Ubuntu دارید، این مرحله را رد کنید و به مرحله ۲ بروید.**

**برای خرید از IONOS (پیشنهادی):** [راهنمای خرید سرور از IONOS](../buy-ionos-server.md)

### نکات خرید:
- سیستم‌عامل: **Ubuntu**
- پلن ارزان کافی است
- لوکیشن به انتخاب شما

**اطلاعات مورد نیاز از سرور:**
- IP سرور
- نام کاربری: root
- رمز عبور

---

--------------------------------------------------
مرحله ۲: اتصال SSH
--------------------------------------------------

**[راهنمای اتصال به سرور با SSH](../ssh-connection.md)**

خلاصه:
```bash
ssh root@SERVER-IP
```

---

--------------------------------------------------
مرحله ۳: نصب لایه ۷ (V2Ray VMess)
--------------------------------------------------

این دستور را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/install.sh -o install.sh && bash install.sh
```

نصب خودکار انجام می‌شود.
V2Ray با VMess روی پورت 443 راه‌اندازی می‌شود.

---

--------------------------------------------------
مرحله ۴: اضافه کردن کاربر
--------------------------------------------------

برای هر نفر یک کاربر بسازید. بعد از اضافه کردن کاربر، کانفیگ اتصال (UUID و JSON) نمایش داده می‌شود:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

**توجه:** اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ قبلی برگردانده می‌شود.

---

--------------------------------------------------
مرحله ۵: حذف کاربر (در صورت نیاز)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

بعد از حذف، کاربر دیگر نمی‌تواند با کانفیگ قبلی متصل شود.

---

## استفاده در iOS (V2Box یا Shadowrocket)

برای iOS می‌توانید از این اپلیکیشن‌ها استفاده کنید:
- **V2Box** (رایگان در App Store)
- **Shadowrocket** (پولی ولی بهتر)

### مرحله ۱: نصب اپلیکیشن

وارد App Store شوید و **V2Box** را نصب کنید.

### مرحله ۲: اضافه کردن کانفیگ

دو روش دارید:

**روش ۱: اسکن QR Code (راحت‌تر)**
- در اپلیکیشن روی + یا Scan بزنید
- QR Code نمایش داده شده در سرور را اسکن کنید

**روش ۲: کپی لینک**
- لینک VMess که بعد از نصب گرفتید را کپی کنید
- در اپلیکیشن Paste from Clipboard بزنید

### مرحله ۳: اتصال

روی کانفیگ کلیک کنید و Connect بزنید.

✅ اتصال برقرار شد!

---

## استفاده در Android (V2RayNG)

### مرحله ۱: نصب اپلیکیشن

از Google Play یا GitHub اپلیکیشن **V2RayNG** را نصب کنید.

لینک GitHub:
https://github.com/2dust/v2rayNG/releases

### مرحله ۲: اضافه کردن کانفیگ

**روش ۱: اسکن QR Code**
- روی + کلیک کنید
- "Scan QR code" را انتخاب کنید
- QR Code سرور را اسکن کنید

**روش ۲: Import از کلیپ‌بورد**
- لینک VMess را کپی کنید
- در اپلیکیشن روی + بزنید
- "Import config from clipboard" را انتخاب کنید

### مرحله ۳: اتصال

روی کانفیگ کلیک کنید و دکمه اتصال را بزنید.

✅ اتصال برقرار شد!

---

## نکات مهم

- این روش نیاز به کلاینت V2Ray دارد (نه SSH)
- برای iOS: V2Box یا Shadowrocket
- برای Android: V2RayNG
- بهترین روش برای سانسور سخت
- UUID و لینک را ایمن نگه دارید

---

=====================================================================

# Layer 7: V2Ray VMess - Advanced Obfuscation

> **⭐⭐⭐⭐ For hard censorship**
> Port 443 - VMess protocol with WebSocket

[← Back to main guide](../README.md)

---

## What is this method?

V2Ray with VMess protocol - an advanced protocol that fully obfuscates traffic.
Uses WebSocket to look exactly like normal web traffic.

**Advantages:**
- Very advanced obfuscation
- Passes hard censorship
- Looks like real web traffic
- Powerful VMess protocol

**Compared to previous layers:**
- Hardest to detect
- Best for hard censorship environments
- More complex installation and configuration
- Requires V2Ray client

---

--------------------------------------------------
Step 1: Purchase VPS Server
--------------------------------------------------

**If you already have a Linux server with Ubuntu, skip this step and go to Step 2.**

**To purchase from IONOS (recommended):** [Guide to Purchasing Server from IONOS](../buy-ionos-server.md)

### Purchase notes:
- Operating system: **Ubuntu**
- Cheap plan is sufficient
- Location is your choice

**Required information from server:**
- Server IP
- Username: root
- Password

---

--------------------------------------------------
Step 2: SSH Connection
--------------------------------------------------

**[Guide to Connecting to Server with SSH](../ssh-connection.md)**

Summary:
```bash
ssh root@SERVER-IP
```

---

--------------------------------------------------
Step 3: Install Layer 7 (V2Ray VMess)
--------------------------------------------------

Run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/install.sh -o install.sh && bash install.sh
```

Installation runs automatically.
V2Ray with VMess will be configured on port 443.

---

--------------------------------------------------
Step 4: Add User
--------------------------------------------------

Create a user for each person. After adding a user, the connection config (UUID and JSON) will be displayed:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

**Note:** If you add the same username again, the same config will be returned.

---

--------------------------------------------------
Step 5: Delete User (if needed)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

After deletion, the user can no longer connect with their previous config.

---

## iOS Usage (V2Box or Shadowrocket)

For iOS you can use these apps:
- **V2Box** (free on App Store)
- **Shadowrocket** (paid but better)

### Step 1: Install App

Go to App Store and install **V2Box**.

### Step 2: Add Config

Two methods:

**Method 1: Scan QR Code (easier)**
- In app, tap + or Scan
- Scan the QR code shown on server

**Method 2: Copy Link**
- Copy the VMess link you received after installation
- In app, select Paste from Clipboard

### Step 3: Connect

Click on the config and tap Connect.

✅ Connected successfully!

---

## Android Usage (V2RayNG)

### Step 1: Install App

Install **V2RayNG** from Google Play or GitHub.

GitHub link:
https://github.com/2dust/v2rayNG/releases

### Step 2: Add Config

**Method 1: Scan QR Code**
- Tap +
- Select "Scan QR code"
- Scan server QR code

**Method 2: Import from Clipboard**
- Copy VMess link
- In app, tap +
- Select "Import config from clipboard"

### Step 3: Connect

Tap on config and press connect button.

✅ Connected successfully!

---

## Important Notes

- This method requires V2Ray client (not SSH)
- For iOS: V2Box or Shadowrocket
- For Android: V2RayNG
- Best method for hard censorship
- Keep UUID and link secure

---

**Made with ❤️ for internet freedom**
