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
مرحله ۱: خرید سرور VPS (IONOS)
--------------------------------------------------

اگر قبلاً سرور خریده‌اید، به مرحله بعد بروید.

لینک خرید:
https://www.ionos.co.uk/servers/vps

![VPS Selection](https://github.com/user-attachments/assets/76de78dc-0a84-47ae-9a58-b3665330b168)

### نکات خرید:
- سیستم‌عامل: **Ubuntu**
- پلن ارزان کافی است
- لوکیشن به انتخاب شما

![VPS Selection](https://github.com/user-attachments/assets/823cb7b2-8a84-40fd-9caa-d85563ede9ee)

---

## بعد از خرید

وارد پنل IONOS شوید:
https://my.ionos.co.uk/server

<img width="1182" height="1388" alt="IONOS Panel" src="https://github.com/user-attachments/assets/46a45e79-c30c-44ca-b8cb-3508616e72f7" />

**اطلاعات مهم:**
- IP سرور
- نام کاربری: root
- رمز عبور

<img width="1182" height="1387" alt="Server Info" src="https://github.com/user-attachments/assets/8cf364c3-a090-4f20-b496-ab45ed2f3659" />

---

--------------------------------------------------
مرحله ۲: اتصال SSH
--------------------------------------------------

باز کنید:
- ویندوز: CMD یا PowerShell
- مک/لینوکس: Terminal

دستور:
```bash
ssh root@SERVER-IP
```

مثال:
```bash
ssh root@185.xxx.xxx.xxx
```

![SSH Command](https://github.com/user-attachments/assets/394ee09f-9be4-4b5e-b874-d03e0a470539)

در اولین اتصال `yes` را تایپ کنید.

![SSH Confirm](https://github.com/user-attachments/assets/ea212a44-273a-417b-b678-63bf2b887d9a)

رمز عبور سرور را وارد کنید (نمایش داده نمی‌شود).

![Password Entry](https://github.com/user-attachments/assets/d8b8188d-8398-4921-81f2-5fd670fd1dbe)

وارد سرور شدید:

![SSH Connected](https://github.com/user-attachments/assets/514ea69f-1e51-4c81-b6f3-cc50b7ceaa9c)

---

--------------------------------------------------
مرحله ۳: نصب لایه ۷ (V2Ray VMess)
--------------------------------------------------

این دستور را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer7-v2ray-vmess/install.sh -o install.sh && bash install.sh
```

نصب خودکار انجام می‌شود.
V2Ray با VMess روی پورت 443 راه‌اندازی می‌شود.

**بعد از نصب شما دریافت می‌کنید:**
- UUID کاربر
- لینک اشتراک VMess
- QR Code برای اسکن در موبایل

---

--------------------------------------------------
مرحله ۴: اضافه کردن کاربر جدید
--------------------------------------------------

برای هر نفر یک کاربر بسازید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

**توجه:** برای V2Ray، اسکریپت UUID جدید و لینک کانفیگ می‌سازد.

---

--------------------------------------------------
مرحله ۵: حذف کاربر (در صورت نیاز)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

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
Step 1: Purchase VPS Server (IONOS)
--------------------------------------------------

If you already have a server, skip to next step.

Purchase link:
https://www.ionos.co.uk/servers/vps

![VPS Selection](https://github.com/user-attachments/assets/76de78dc-0a84-47ae-9a58-b3665330b168)

### Purchase notes:
- Operating system: **Ubuntu**
- Cheap plan is sufficient
- Location is your choice

![VPS Selection](https://github.com/user-attachments/assets/823cb7b2-8a84-40fd-9caa-d85563ede9ee)

---

## After Purchase

Log in to IONOS panel:
https://my.ionos.co.uk/server

<img width="1182" height="1388" alt="IONOS Panel" src="https://github.com/user-attachments/assets/46a45e79-c30c-44ca-b8cb-3508616e72f7" />

**Important information:**
- Server IP
- Username: root
- Password

<img width="1182" height="1387" alt="Server Info" src="https://github.com/user-attachments/assets/8cf364c3-a090-4f20-b496-ab45ed2f3659" />

---

--------------------------------------------------
Step 2: SSH Connection
--------------------------------------------------

Open:
- Windows: CMD or PowerShell
- Mac/Linux: Terminal

Command:
```bash
ssh root@SERVER-IP
```

Example:
```bash
ssh root@185.xxx.xxx.xxx
```

![SSH Command](https://github.com/user-attachments/assets/394ee09f-9be4-4b5e-b874-d03e0a470539)

On first connection, type `yes`.

![SSH Confirm](https://github.com/user-attachments/assets/ea212a44-273a-417b-b678-63bf2b887d9a)

Enter server password (not displayed).

![Password Entry](https://github.com/user-attachments/assets/d8b8188d-8398-4921-81f2-5fd670fd1dbe)

You're in:

![SSH Connected](https://github.com/user-attachments/assets/514ea69f-1e51-4c81-b6f3-cc50b7ceaa9c)

---

--------------------------------------------------
Step 3: Install Layer 7 (V2Ray VMess)
--------------------------------------------------

Run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer7-v2ray-vmess/install.sh -o install.sh && bash install.sh
```

Installation runs automatically.
V2Ray with VMess will be configured on port 443.

**After installation you'll receive:**
- User UUID
- VMess subscription link
- QR Code for mobile scanning

---

--------------------------------------------------
Step 4: Add New User
--------------------------------------------------

Create a user for each person:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

**Note:** For V2Ray, the script creates a new UUID and config link.

---

--------------------------------------------------
Step 5: Delete User (if needed)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

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
