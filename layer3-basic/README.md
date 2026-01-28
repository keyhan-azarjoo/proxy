# لایه ۳: SSH پایه - ساده‌ترین روش

> **⭐ آسان‌ترین روش برای شروع**
> پورت 22 - مناسب تست و یادگیری

[← بازگشت به راهنمای اصلی](../README.md)

---

## این روش چیست؟

ساده‌ترین روش پراکسی که از SSH استاندارد روی پورت 22 استفاده می‌کند.

**مزایا:**
- نصب بسیار آسان (5 دقیقه)
- بدون نیاز به تنظیمات پیچیده
- رمزنگاری SSH استاندارد

**محدودیت:**
- پورت 22 در برخی شبکه‌ها ممکن است فیلتر باشد
- برای سانسور سخت مناسب نیست

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
مرحله ۳: نصب لایه ۳
--------------------------------------------------

این دستور را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer3-basic/install.sh -o install.sh && bash install.sh
```

نصب خودکار انجام می‌شود.

---

--------------------------------------------------
مرحله ۴: اضافه کردن کاربر
--------------------------------------------------

برای هر نفر یک کاربر بسازید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

نام کاربری و رمز عبور را وارد کنید.

---

--------------------------------------------------
مرحله ۵: حذف کاربر (در صورت نیاز)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

---

## استفاده در iOS (NPV Tunnel)

### مرحله ۱: نصب اپلیکیشن

وارد App Store شوید و جستجو کنید:
**NPV Tunnel**

![NPV App Store](https://github.com/user-attachments/assets/22d012dd-eea8-4bde-9146-3a0e52154a88)

---

### مرحله ۲: ورود به Config

![Config Tab](https://github.com/user-attachments/assets/2497ee34-fcb2-4575-9e42-2b930b8d0b8d)

---

### مرحله ۳: اضافه کردن تنظیمات

روی **+** کلیک کنید.

![Add Config](https://github.com/user-attachments/assets/a9b01bb9-f03d-4d5e-bcf7-d920b44660a4)

**Add Config Manually** را انتخاب کنید.

![Add Manually](https://github.com/user-attachments/assets/b87227d4-5b41-443f-8707-2a322d2c018f)

---

### مرحله ۴: انتخاب SSH Config

![SSH Config](https://github.com/user-attachments/assets/ac804061-e32d-423a-8387-69d25e326e27)

---

### مرحله ۵: وارد کردن اطلاعات

اطلاعات را وارد کنید:
- SSH Host: IP سرور
- Port: **22**
- Username: نام کاربری شما
- Password: رمز عبور شما

![Fill SSH Info](https://github.com/user-attachments/assets/b232e341-4d59-4f2b-804d-d923f31a03e6)

روی **Save** کلیک کنید و سپس **Connect**.

✅ اتصال برقرار شد!

---

## استفاده در Android (Net Mod)

قدم به قدم:

![Android Step 1](https://github.com/user-attachments/assets/72e7e385-83cf-4139-98df-4d41a5097916)

![Android Step 2](https://github.com/user-attachments/assets/c308415b-1484-448d-8c9d-69c5c97aab2d)

![Android Step 3](https://github.com/user-attachments/assets/86f3cea3-3d09-48bd-93f0-7824ffa10cb1)

![Android Step 4](https://github.com/user-attachments/assets/9062ea58-d7bc-400c-92bb-0b00a830757a)

![Android Step 5](https://github.com/user-attachments/assets/2847c64f-7061-4860-96b8-c131cc672031)

**تنظیمات Android:**
- Host: IP سرور
- Port: **22**
- Username: نام کاربری
- Password: رمز عبور

---

## نکات مهم

- پورت 22 در برخی شبکه‌ها ممکن است فیلتر شود
- برای استفاده روزمره لایه ۴ (Nginx) بهتر است
- این روش برای یادگیری و تست عالی است

---

=====================================================================

# Layer 3: Basic SSH - Simplest Method

> **⭐ Easiest way to start**
> Port 22 - Great for testing and learning

[← Back to main guide](../README.md)

---

## What is this method?

The simplest proxy method using standard SSH on port 22.

**Advantages:**
- Very easy installation (5 minutes)
- No complex configuration needed
- Standard SSH encryption

**Limitations:**
- Port 22 may be filtered in some networks
- Not suitable for hard censorship

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
Step 3: Install Layer 3
--------------------------------------------------

Run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer3-basic/install.sh -o install.sh && bash install.sh
```

Installation runs automatically.

---

--------------------------------------------------
Step 4: Add User
--------------------------------------------------

Create a user for each person:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

Enter username and password.

---

--------------------------------------------------
Step 5: Delete User (if needed)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

---

## iOS Usage (NPV Tunnel)

### Step 1: Install App

Go to App Store and search:
**NPV Tunnel**

![NPV App Store](https://github.com/user-attachments/assets/22d012dd-eea8-4bde-9146-3a0e52154a88)

---

### Step 2: Go to Config

![Config Tab](https://github.com/user-attachments/assets/2497ee34-fcb2-4575-9e42-2b930b8d0b8d)

---

### Step 3: Add Configuration

Click **+**.

![Add Config](https://github.com/user-attachments/assets/a9b01bb9-f03d-4d5e-bcf7-d920b44660a4)

Select **Add Config Manually**.

![Add Manually](https://github.com/user-attachments/assets/b87227d4-5b41-443f-8707-2a322d2c018f)

---

### Step 4: Select SSH Config

![SSH Config](https://github.com/user-attachments/assets/ac804061-e32d-423a-8387-69d25e326e27)

---

### Step 5: Enter Information

Fill in:
- SSH Host: Server IP
- Port: **22**
- Username: Your username
- Password: Your password

![Fill SSH Info](https://github.com/user-attachments/assets/b232e341-4d59-4f2b-804d-d923f31a03e6)

Click **Save** then **Connect**.

✅ Connected successfully!

---

## Android Usage (Net Mod)

Step by step:

![Android Step 1](https://github.com/user-attachments/assets/72e7e385-83cf-4139-98df-4d41a5097916)

![Android Step 2](https://github.com/user-attachments/assets/c308415b-1484-448d-8c9d-69c5c97aab2d)

![Android Step 3](https://github.com/user-attachments/assets/86f3cea3-3d09-48bd-93f0-7824ffa10cb1)

![Android Step 4](https://github.com/user-attachments/assets/9062ea58-d7bc-400c-92bb-0b00a830757a)

![Android Step 5](https://github.com/user-attachments/assets/2847c64f-7061-4860-96b8-c131cc672031)

**Android settings:**
- Host: Server IP
- Port: **22**
- Username: Your username
- Password: Your password

---

## Important Notes

- Port 22 may be filtered in some networks
- For daily use, Layer 4 (Nginx) is better
- This method is great for learning and testing

---

**Made with ❤️ for internet freedom**
