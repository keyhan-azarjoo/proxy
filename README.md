# راهکار کامل، امن و حرفه‌ای برای راه‌اندازی پراکسی خصوصی

مخصوص سرورهای Ubuntu – مناسب کاربران عادی و حرفه‌ای

راهنمای فارسی
=====================================================================

## این پروژه چیست و به چه درد می‌خورد؟

این پروژه به شما اجازه می‌دهد سرور VPS خود را به یک **پراکسی خصوصی** تبدیل کنید که:

- ارتباط آن **کاملاً رمزنگاری‌شده** است
- هیچ نرم‌افزار جانبی روی سیستم شما لازم ندارد
- کاربران فقط به پراکسی دسترسی دارند (نه به خود سرور)
- برای استفاده شخصی، کاری، تیمی کوچک یا تست بسیار مناسب است

اگر می‌خواهید:
- اینترنت خود را از یک IP ثابت استفاده کنید
- پراکسی اختصاصی و امن داشته باشید
- کنترل کامل روی کاربران داشته باشید

این ابزار دقیقاً برای همین ساخته شده است.

---

## سازگاری (روی چه دستگاه‌هایی کار می‌کند؟)

این پراکسی روی همه سیستم‌ها قابل استفاده است:

- iOS (اپلیکیشن NPV Tunnel)
- Android (اپلیکیشن Net Mod / V2RayNG)
- Windows
- Linux
- macOS

---

## پیش‌نیازها

قبل از شروع فقط به این موارد نیاز دارید:
- یک سرور VPS با سیستم‌عامل Ubuntu
- دسترسی root به سرور
- اینترنت معمولی (هیچ چیز خاصی لازم نیست)

---

## نحوه استفاده از این راهنما

**مهم:** مراحل را به ترتیب و یکی یکی انجام دهید. هر مرحله را کامل کنید و سپس به مرحله بعد بروید.

---

--------------------------------------------------
مرحله ۱: خرید سرور VPS
--------------------------------------------------

**اگر از قبل سرور لینوکس با Ubuntu دارید، این مرحله را رد کنید و به مرحله ۲ بروید.**

برای شروع باید یک سرور VPS تهیه کنید.
هر VPS با سیستم‌عامل Ubuntu قابل استفاده است.

**برای خرید از IONOS (پیشنهادی):** [راهنمای خرید سرور از IONOS](./buy-ionos-server.md)

### نکات مهم:
- سیستم‌عامل حتماً **Ubuntu**
- پلن ارزان هم کاملاً کافی است
- لوکیشن سرور به نیاز شما بستگی دارد

پس از خرید سرور، اطلاعات زیر را از پنل ارائه‌دهنده دریافت کنید:
- **IP سرور** (خیلی مهم)
- **نام کاربری:** root
- **رمز عبور اولیه**

این اطلاعات را نگه دارید.

---

--------------------------------------------------
مرحله ۲: اتصال به سرور با SSH
--------------------------------------------------

برای اتصال به سرور از طریق SSH، به راهنمای کامل مراجعه کنید:

**[راهنمای اتصال به سرور با SSH](./ssh-connection.md)**

### خلاصه:
```bash
ssh root@SERVER-IP
```

پس از اتصال، ادامه دهید.

---

--------------------------------------------------
انتخاب روش نصب
--------------------------------------------------

### شما ۵ روش مختلف دارید:

| روش | سختی | بهترین برای | پورت |
|-----|------|------------|------|
| **لایه ۳: SSH پایه** | ⭐ آسان | شروع و تست | 22 |
| **لایه ۴: Nginx** | ⭐⭐ آسان | استفاده روزانه | 443 |
| **لایه ۶: Stunnel** | ⭐⭐⭐ متوسط | امنیت بالا | 443 |
| **لایه ۷: V2Ray VMess** | ⭐⭐⭐⭐ پیشرفته | سانسور سخت | 443 |
| **لایه ۷: دامنه واقعی (VLESS/Trojan)** | ⭐⭐⭐⭐⭐ پیشرفته | بهترین امنیت | 443 |

**💡 توصیه برای مبتدیان: لایه ۴ (Nginx)**

---

### 📚 راهنمای کامل هر روش:

- [لایه ۳: SSH پایه](./layer3-basic/README.md) - ساده‌ترین روش برای شروع
- [لایه ۴: Nginx](./layer4-nginx/README.md) - پیشنهادی برای استفاده روزمره
- [لایه ۶: Stunnel](./layer6-stunnel/README.md) - امنیت دوبل با TLS wrapper
- [لایه ۷: V2Ray VMess](./layer7-v2ray-vmess/README.md) - مخفی‌سازی پیشرفته
- [لایه ۷: دامنه واقعی + TLS](./layer7-real-domain/README.md) - بهترین روش کلی

---

--------------------------------------------------
مرحله ۳: نصب (بسته به روش انتخابی)
--------------------------------------------------

### لایه ۴ - Nginx (پیشنهادی)

این دستور را اجرا کنید:
```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer4-nginx/install.sh -o install.sh && bash install.sh
```

نصب به طور خودکار انجام می‌شود.

---

--------------------------------------------------
مرحله ۴: اضافه کردن کاربر
--------------------------------------------------

برای هر کسی که می‌خواهد از پراکسی استفاده کند، یک کاربر بسازید.

دستور:
```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

از شما نام کاربری و رمز عبور پرسیده می‌شود.

**نکات مهم:**
- رمز عبور باید حداقل ۸ کاراکتر باشد
- هنگام تایپ رمز، چیزی نمایش داده نمی‌شود (این طبیعی است و برای امنیت است)

---

--------------------------------------------------
مرحله ۵: حذف کاربر (در صورت نیاز)
--------------------------------------------------

اگر خواستید دسترسی کاربری را قطع کنید:
```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

---

--------------------------------------------------
مرحله ۶: مدیریت و مانیتورینگ کاربران
--------------------------------------------------

برای مشاهده کاربران متصل، میزان مصرف پهنای باند، و زمان اتصالات:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/view-users.sh -o view-users.sh && bash view-users.sh
```

این اسکریپت به شما امکان می‌دهد:
- لیست تمام کاربران تعریف‌شده را ببینید
- کاربران متصل فعلی را مشاهده کنید
- میزان مصرف پهنای باند را بررسی کنید
- زمان اتصال هر کاربر را ببینید
- منابع سرور (CPU، RAM، دیسک) را کنترل کنید

---

--------------------------------------------------
نکات امنیتی بسیار مهم
--------------------------------------------------

- تمام ترافیک خروجی به نام IP شما ثبت می‌شود
- مسئولیت استفاده با مالک سرور است
- از رمز عبور قوی استفاده کنید
- این ابزار برای استفاده شخصی و کنترل‌شده طراحی شده

---

## راهنمای استفاده در iOS (NPV Tunnel)

در این بخش توضیح داده می‌شود که چگونه پراکسی ساخته‌شده را روی **آیفون یا آیپد** با استفاده از اپلیکیشن **NPV Tunnel** فعال کنید.

--------------------------------------------------
مرحله ۱: نصب اپلیکیشن
--------------------------------------------------

وارد **App Store** شوید و عبارت زیر را جستجو کنید:

**NPV Tunnel**

![NPV App Store](https://github.com/user-attachments/assets/22d012dd-eea8-4bde-9146-3a0e52154a88)

پس از نصب، برنامه را باز کنید.

--------------------------------------------------
مرحله ۲: ورود به بخش تنظیمات (Config)
--------------------------------------------------

پس از باز شدن برنامه، به تب **Config** بروید.

![Config Tab](https://github.com/user-attachments/assets/2497ee34-fcb2-4575-9e42-2b930b8d0b8d)

--------------------------------------------------
مرحله ۳: اضافه کردن تنظیمات جدید
--------------------------------------------------

در صفحه Config، روی دکمه **+** کلیک کنید.

![Add Config](https://github.com/user-attachments/assets/a9b01bb9-f03d-4d5e-bcf7-d920b44660a4)

سپس گزینه **Add Config Manually** را انتخاب کنید.

![Add Manually](https://github.com/user-attachments/assets/b87227d4-5b41-443f-8707-2a322d2c018f)

--------------------------------------------------
مرحله ۴: انتخاب نوع اتصال (SSH)
--------------------------------------------------

در لیست نمایش داده‌شده، گزینه **SSH Config** را انتخاب کنید.

![SSH Config](https://github.com/user-attachments/assets/ac804061-e32d-423a-8387-69d25e326e27)

--------------------------------------------------
مرحله ۵: وارد کردن اطلاعات سرور
--------------------------------------------------

در این مرحله اطلاعاتی که هنگام ساخت کاربر پراکسی دریافت کرده‌اید را وارد کنید:

- SSH Host: IP سرور VPS
- Port: 443 (یا 22 برای لایه ۳)
- Username: نام کاربری ساخته‌شده
- Password: رمز عبور همان کاربر

سپس روی دکمه **Save** کلیک کنید.

![Fill SSH Info](https://github.com/user-attachments/assets/b232e341-4d59-4f2b-804d-d923f31a03e6)

--------------------------------------------------
مرحله ۶: اتصال به پراکسی
--------------------------------------------------

اکنون به صفحه اصلی برنامه برگردید و روی **Connect** کلیک کنید.

در صورت صحیح بودن اطلاعات:
- اتصال برقرار می‌شود
- اینترنت شما از طریق سرور VPS عبور می‌کند
- تمام ترافیک به‌صورت رمزنگاری‌شده ارسال می‌شود

✅ اتصال با موفقیت انجام شد

--------------------------------------------------
نکات مهم برای iOS
--------------------------------------------------

- اگر اتصال برقرار نشد، نام کاربری و رمز عبور را دوباره بررسی کنید
- حتماً کاربر را با اسکریپت add-user ساخته باشید
- اینترنت موبایل یا Wi-Fi تفاوتی ندارد
- برای قطع اتصال، فقط Disconnect را بزنید

---

## راهنمای استفاده در Android (Net Mod)

برای اندروید:
مراحل زیر را قدم به قدم انجام دهید

![photo_6033040608672288849_y](https://github.com/user-attachments/assets/72e7e385-83cf-4139-98df-4d41a5097916)

![photo_6033040608672288847_y](https://github.com/user-attachments/assets/c308415b-1484-448d-8c9d-69c5c97aab2d)

![photo_6033040608672288850_y](https://github.com/user-attachments/assets/86f3cea3-3d09-48bd-93f0-7824ffa10cb1)

![photo_6033040608672288851_y](https://github.com/user-attachments/assets/9062ea58-d7bc-400c-92bb-0b00a830757a)

![photo_6033040608672288848_y](https://github.com/user-attachments/assets/2847c64f-7061-4860-96b8-c131cc672031)

---

=====================================================================

# Complete, Secure, and Professional Proxy Solution

For Ubuntu Servers – Suitable for Regular and Professional Users

English Guide
=====================================================================

## What is this project and what is it for?

This project allows you to turn your VPS server into a **private proxy** that:

- Communication is **fully encrypted**
- No third-party software needed on your system
- Users only have access to the proxy (not the server itself)
- Perfect for personal, work, small team, or testing use

If you want to:
- Use the internet from a static IP
- Have a dedicated and secure proxy
- Have full control over users

This tool is built exactly for this purpose.

---

## Compatibility (What devices does it work on?)

This proxy can be used on all systems:

- iOS (NPV Tunnel app)
- Android (Net Mod / V2RayNG app)
- Windows
- Linux
- macOS

---

## Prerequisites

Before starting, you only need these:
- A VPS server with Ubuntu operating system
- Root access to the server
- Regular internet (nothing special required)

---

## How to Use This Guide

**Important:** Follow the steps in order, one by one. Complete each step before moving to the next.

---

--------------------------------------------------
Step 1: Purchase VPS Server
--------------------------------------------------

**If you already have a Linux server with Ubuntu, skip this step and go to Step 2.**

To get started, you need to get a VPS server.
Any VPS with Ubuntu operating system can be used.

**To purchase from IONOS (recommended):** [Guide to Purchasing Server from IONOS](./buy-ionos-server.md)

### Important notes:
- Operating system must be **Ubuntu**
- Even a cheap plan is completely sufficient
- Server location depends on your needs

After purchasing the server, get the following information from your provider's panel:
- **Server IP** (very important)
- **Username:** root
- **Initial password**

Keep this information safe.

---

--------------------------------------------------
Step 2: Connect to Server via SSH
--------------------------------------------------

For connecting to the server via SSH, refer to the complete guide:

**[Guide to Connecting to Server with SSH](./ssh-connection.md)**

### Summary:
```bash
ssh root@SERVER-IP
```

After connecting, continue below.

---

--------------------------------------------------
Choose Installation Method
--------------------------------------------------

### You have 5 different methods:

| Method | Difficulty | Best For | Port |
|--------|-----------|----------|------|
| **Layer 3: Basic SSH** | ⭐ Easy | Start and test | 22 |
| **Layer 4: Nginx** | ⭐⭐ Easy | Daily use | 443 |
| **Layer 6: Stunnel** | ⭐⭐⭐ Medium | High security | 443 |
| **Layer 7: V2Ray VMess** | ⭐⭐⭐⭐ Advanced | Hard censorship | 443 |
| **Layer 7: Real Domain (VLESS/Trojan)** | ⭐⭐⭐⭐⭐ Advanced | Best security | 443 |

**💡 Recommendation for beginners: Layer 4 (Nginx)**

---

### 📚 Complete guide for each method:

- [Layer 3: Basic SSH](./layer3-basic/README.md) - Simplest method to get started
- [Layer 4: Nginx](./layer4-nginx/README.md) - Recommended for daily use
- [Layer 6: Stunnel](./layer6-stunnel/README.md) - Double security with TLS wrapper
- [Layer 7: V2Ray VMess](./layer7-v2ray-vmess/README.md) - Advanced obfuscation
- [Layer 7: Real Domain + TLS](./layer7-real-domain/README.md) - Best overall method

---

--------------------------------------------------
Step 3: Installation (depending on chosen method)
--------------------------------------------------

### Layer 4 - Nginx (Recommended)

Run this command:
```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer4-nginx/install.sh -o install.sh && bash install.sh
```

Installation is done automatically.

---

--------------------------------------------------
Step 4: Add User
--------------------------------------------------

For each person who wants to use the proxy, create a user.

Command:
```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

You will be asked for username and password.

**Important notes:**
- Password must be at least 8 characters
- Password won't be visible while typing (this is normal for security)

---

--------------------------------------------------
Step 5: Delete User (if needed)
--------------------------------------------------

If you want to revoke user access:
```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

---

--------------------------------------------------
Step 6: User Management and Monitoring
--------------------------------------------------

To view connected users, bandwidth usage, and connection times:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/view-users.sh -o view-users.sh && bash view-users.sh
```

This script allows you to:
- See list of all defined users
- View currently connected users
- Check bandwidth consumption
- See connection times for each user
- Monitor server resources (CPU, RAM, Disk)

---

--------------------------------------------------
Very Important Security Notes
--------------------------------------------------

- All outgoing traffic is logged under your IP name
- Responsibility for use lies with the server owner
- Use a strong password
- This tool is designed for personal and controlled use

---

## iOS Usage Guide (NPV Tunnel)

This section explains how to activate the created proxy on **iPhone or iPad** using the **NPV Tunnel** app.

--------------------------------------------------
Step 1: Install the App
--------------------------------------------------

Go to **App Store** and search for:

**NPV Tunnel**

![NPV App Store](https://github.com/user-attachments/assets/22d012dd-eea8-4bde-9146-3a0e52154a88)

After installation, open the app.

--------------------------------------------------
Step 2: Go to Config Section
--------------------------------------------------

After opening the app, go to the **Config** tab.

![Config Tab](https://github.com/user-attachments/assets/2497ee34-fcb2-4575-9e42-2b930b8d0b8d)

--------------------------------------------------
Step 3: Add New Configuration
--------------------------------------------------

On the Config page, click the **+** button.

![Add Config](https://github.com/user-attachments/assets/a9b01bb9-f03d-4d5e-bcf7-d920b44660a4)

Then select **Add Config Manually**.

![Add Manually](https://github.com/user-attachments/assets/b87227d4-5b41-443f-8707-2a322d2c018f)

--------------------------------------------------
Step 4: Select Connection Type (SSH)
--------------------------------------------------

In the displayed list, select **SSH Config**.

![SSH Config](https://github.com/user-attachments/assets/ac804061-e32d-423a-8387-69d25e326e27)

--------------------------------------------------
Step 5: Enter Server Information
--------------------------------------------------

At this step, enter the information you received when creating the proxy user:

- SSH Host: VPS server IP
- Port: 443 (or 22 for layer 3)
- Username: Created username
- Password: Password for that user

Then click the **Save** button.

![Fill SSH Info](https://github.com/user-attachments/assets/b232e341-4d59-4f2b-804d-d923f31a03e6)

--------------------------------------------------
Step 6: Connect to Proxy
--------------------------------------------------

Now return to the app's main page and click **Connect**.

If the information is correct:
- Connection is established
- Your internet goes through the VPS server
- All traffic is sent encrypted

✅ Connection successful

--------------------------------------------------
Important Notes for iOS
--------------------------------------------------

- If connection fails, recheck username and password
- Make sure you created the user with the add-user script
- Mobile internet or Wi-Fi makes no difference
- To disconnect, just hit Disconnect

---

## Android Usage Guide (Net Mod)

For Android:
Follow these steps one by one

![photo_6033040608672288849_y](https://github.com/user-attachments/assets/72e7e385-83cf-4139-98df-4d41a5097916)

![photo_6033040608672288847_y](https://github.com/user-attachments/assets/c308415b-1484-448d-8c9d-69c5c97aab2d)

![photo_6033040608672288850_y](https://github.com/user-attachments/assets/86f3cea3-3d09-48bd-93f0-7824ffa10cb1)

![photo_6033040608672288851_y](https://github.com/user-attachments/assets/9062ea58-d7bc-400c-92bb-0b00a830757a)

![photo_6033040608672288848_y](https://github.com/user-attachments/assets/2847c64f-7061-4860-96b8-c131cc672031)
