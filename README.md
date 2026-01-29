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

### شما ۶ روش مختلف دارید:

| روش | سختی | بهترین برای | پورت |
|-----|------|------------|------|
| **لایه ۳: SSH پایه** | ⭐ آسان | شروع و تست | 22 |
| **لایه ۴: Nginx** | ⭐⭐ آسان | استفاده روزانه | 443 |
| **لایه ۶: Stunnel** | ⭐⭐⭐ متوسط | امنیت بالا | 443 |
| **لایه ۷: V2Ray VMess** | ⭐⭐⭐⭐ پیشرفته | سانسور سخت | 443 |
| **لایه ۷: V2Ray VLESS** | ⭐⭐⭐⭐ پیشرفته | سانسور سخت | 443 |
| **لایه ۷: دامنه واقعی (VLESS/Trojan)** | ⭐⭐⭐⭐⭐ پیشرفته | بهترین امنیت | 443 |

**💡 توصیه برای مبتدیان: لایه ۴ (Nginx)**

---

### 📚 راهنمای کامل هر روش:

- [لایه ۳: SSH پایه](./layer3-basic/README.md) - ساده‌ترین روش برای شروع
- [لایه ۴: Nginx](./layer4-nginx/README.md) - پیشنهادی برای استفاده روزمره
- [لایه ۶: Stunnel](./layer6-stunnel/README.md) - امنیت دوبل با TLS wrapper
- [لایه ۷: V2Ray VMess](./layer7-v2ray-vmess/README.md) - مخفی‌سازی پیشرفته
- [لایه ۷: V2Ray VLESS](./layer7-v2ray-vless/README.md) - پروتکل مدرن و سبک
- [لایه ۷: دامنه واقعی + TLS](./layer7-real-domain/README.md) - بهترین روش کلی

---

--------------------------------------------------
مرحله ۳: نصب (بسته به روش انتخابی)
--------------------------------------------------
---

--------------------------------------------------
حذف نصب (در صورت نیاز)
--------------------------------------------------

اگر می‌خواهید پراکسی را کاملاً حذف کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/uninstall.sh -o uninstall.sh && bash uninstall.sh
```

**توجه:** اگر سرور را ریست کرده‌اید یا مجدداً نصب می‌کنید، این دستور را روی کامپیوتر خود اجرا کنید تا کلید SSH قدیمی حذف شود:

```bash
ssh-keygen -R SERVER-IP
```

مثال:
```bash
ssh-keygen -R 87.106.68.203
```

---

--------------------------------------------------
نکات امنیتی بسیار مهم
--------------------------------------------------

- تمام ترافیک خروجی به نام IP شما ثبت می‌شود
- مسئولیت استفاده با مالک سرور است
- از رمز عبور قوی استفاده کنید
- این ابزار برای استفاده شخصی و کنترل‌شده طراحی شده

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

### You have 6 different methods:

| Method | Difficulty | Best For | Port |
|--------|-----------|----------|------|
| **Layer 3: Basic SSH** | ⭐ Easy | Start and test | 22 |
| **Layer 4: Nginx** | ⭐⭐ Easy | Daily use | 443 |
| **Layer 6: Stunnel** | ⭐⭐⭐ Medium | High security | 443 |
| **Layer 7: V2Ray VMess** | ⭐⭐⭐⭐ Advanced | Hard censorship | 443 |
| **Layer 7: V2Ray VLESS** | ⭐⭐⭐⭐ Advanced | Hard censorship | 443 |
| **Layer 7: Real Domain (VLESS/Trojan)** | ⭐⭐⭐⭐⭐ Advanced | Best security | 443 |

**💡 Recommendation for beginners: Layer 4 (Nginx)**

---

### 📚 Complete guide for each method:

- [Layer 3: Basic SSH](./layer3-basic/README.md) - Simplest method to get started
- [Layer 4: Nginx](./layer4-nginx/README.md) - Recommended for daily use
- [Layer 6: Stunnel](./layer6-stunnel/README.md) - Double security with TLS wrapper
- [Layer 7: V2Ray VMess](./layer7-v2ray-vmess/README.md) - Advanced obfuscation
- [Layer 7: V2Ray VLESS](./layer7-v2ray-vless/README.md) - Modern and lightweight protocol
- [Layer 7: Real Domain + TLS](./layer7-real-domain/README.md) - Best overall method

---

--------------------------------------------------
Step 3: Installation (depending on chosen method)
--------------------------------------------------
---

--------------------------------------------------
Uninstall (if needed)
--------------------------------------------------

If you want to completely remove the proxy:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/uninstall.sh -o uninstall.sh && bash uninstall.sh
```

**Note:** If you have reset the server or are reinstalling, run this command on your computer to remove the old SSH key:

```bash
ssh-keygen -R SERVER-IP
```

Example:
```bash
ssh-keygen -R 87.106.68.203
```

---

--------------------------------------------------
Very Important Security Notes
--------------------------------------------------

- All outgoing traffic is logged under your IP name
- Responsibility for use lies with the server owner
- Use a strong password
- This tool is designed for personal and controlled use

---

