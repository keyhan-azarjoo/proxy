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

برای هر نفر یک کاربر بسازید. بعد از اضافه کردن کاربر، **۲ کانفیگ JSON** نمایش داده می‌شود:
- کانفیگ iOS (برای NPV Tunnel)
- کانفیگ Android (برای NetMod)

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

**توجه:** اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ قبلی برگردانده می‌شود.

---

--------------------------------------------------
مرحله ۵: مانیتورینگ کاربران
--------------------------------------------------

برای مشاهده کاربران متصل و وضعیت سرور:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/view-users.sh -o view-users.sh && bash view-users.sh
```

---

--------------------------------------------------
مرحله ۶: حذف کاربر (در صورت نیاز)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

بعد از حذف، کاربر دیگر نمی‌تواند با کانفیگ قبلی متصل شود.

---

## استفاده در iOS

[راهنمای اتصال با iOS (NPV Tunnel)](./iOS-SETUP.md)

---

## استفاده در Android

[راهنمای اتصال با Android (NetMod)](./ANDROID-SETUP.md)

---

## نکات مهم

- این روش نیاز به کلاینت V2Ray دارد (نه SSH)
- برای iOS: NPV Tunnel
- برای Android: NetMod
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

Create a user for each person. After adding a user, **2 JSON configs** will be displayed:
- iOS config (for NPV Tunnel)
- Android config (for NetMod)

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

**Note:** If you add the same username again, the same config will be returned.

---

--------------------------------------------------
Step 5: Monitor Users
--------------------------------------------------

To view connected users and server status:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/view-users.sh -o view-users.sh && bash view-users.sh
```

---

--------------------------------------------------
Step 6: Delete User (if needed)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

After deletion, the user can no longer connect with their previous config.

---

## iOS Usage

[iOS Connection Guide (NPV Tunnel)](./iOS-SETUP.md)

---

## Android Usage

[Android Connection Guide (NetMod)](./ANDROID-SETUP.md)

---

## Important Notes

- This method requires V2Ray client (not SSH)
- For iOS: NPV Tunnel
- For Android: NetMod
- Best method for hard censorship
- Keep UUID and link secure

---

**Made with ❤️ for internet freedom**
