# لایه ۷: دامنه واقعی + TLS - بهترین روش کلی

> **⭐⭐⭐⭐⭐ بهترین روش (سخت‌ترین برای فیلتر شدن)**
> پورت 443 - تونل TLS واقعی با گواهی معتبر

[← بازگشت به راهنمای اصلی](../README.md)

---

## این روش چیست؟

این روش از یک **دامنه واقعی** و **گواهی TLS معتبر** استفاده می‌کند.
ترافیک شما دقیقاً شبیه یک وب‌سایت HTTPS معمولی است.

**چرا بهترین است:**
- دامنه واقعی (Real Domain)
- گواهی TLS معتبر (Let's Encrypt)
- اثر انگشت TLS طبیعی
- بدون امضای واضح پروکسی

**نتیجه:** ترافیک از مرور وب معمولی قابل تشخیص نیست.

**امنیت:** ⭐⭐⭐⭐⭐
**مخفی‌سازی:** ⭐⭐⭐⭐⭐
**سرعت:** ⭐⭐⭐⭐☆

---

## نیازمندی اصلی: دامنه

برای این روش به یک دامنه نیاز دارید.

**گزینه ۱: DuckDNS (رایگان و پیشنهادی)**
- کاملاً رایگان
- آسان برای راه‌اندازی
- زیردامنه دریافت می‌کنید (مثلاً myproxy.duckdns.org)

**گزینه ۲: دامنه پولی**
- از هر سایت ثبت دامنه بخرید
- کنترل کامل دارید
- حرفه‌ای‌تر است

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
- IP سرور (این را یادداشت کنید!)
- نام کاربری: root
- رمز عبور

<img width="1182" height="1387" alt="Server Info" src="https://github.com/user-attachments/assets/8cf364c3-a090-4f20-b496-ab45ed2f3659" />

---

--------------------------------------------------
مرحله ۲: دریافت دامنه رایگان (DuckDNS)
--------------------------------------------------

### قدم ۱: ثبت‌نام در DuckDNS

وارد شوید: https://duckdns.org

با GitHub یا Google لاگین کنید.

### قدم ۲: ساخت زیردامنه

یک نام انتخاب کنید (مثلاً):
```
myproxy123.duckdns.org
```

IP سرور IONOS خود را در کادر IP وارد کنید.

TOKEN خود را کپی کنید (نگه دارید).

---

--------------------------------------------------
مرحله ۳: اتصال SSH
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
مرحله ۴: نصب لایه ۷ (دامنه واقعی + TLS)
--------------------------------------------------

این دستور را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer7-real-domain/install.sh -o install.sh && bash install.sh
```

**در طول نصب از شما پرسیده می‌شود:**
1. دامنه شما (مثلاً: myproxy123.duckdns.org)
2. ایمیل شما (برای Let's Encrypt)

اسکریپت:
- گواهی TLS معتبر می‌گیرد
- VLESS/Trojan روی پورت 443 راه‌اندازی می‌کند
- همه چیز را آماده می‌کند

**بعد از نصب دریافت می‌کنید:**
- UUID کاربر
- لینک اشتراک
- QR Code

---

--------------------------------------------------
مرحله ۵: اضافه کردن کاربر جدید
--------------------------------------------------

برای هر نفر یک کاربر بسازید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

---

--------------------------------------------------
مرحله ۶: حذف کاربر (در صورت نیاز)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

---

## استفاده در iOS (V2Box یا Shadowrocket)

### مرحله ۱: نصب اپلیکیشن

از App Store یکی از این‌ها را نصب کنید:
- **V2Box** (رایگان)
- **Shadowrocket** (پولی ولی بهتر)

### مرحله ۲: اضافه کردن کانفیگ

**روش ۱: اسکن QR Code (راحت‌تر)**
- در اپلیکیشن روی + یا Scan بزنید
- QR Code نمایش داده شده در سرور را اسکن کنید

**روش ۲: کپی لینک**
- لینک VLESS/Trojan که بعد از نصب گرفتید را کپی کنید
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
- لینک را کپی کنید
- در اپلیکیشن روی + بزنید
- "Import config from clipboard" را انتخاب کنید

### مرحله ۳: اتصال

روی کانفیگ کلیک کنید و دکمه اتصال را بزنید.

✅ اتصال برقرار شد!

---

## آپدیت خودکار DNS (اختیاری)

اگر IP سرور عوض شود، این دستور را روی سرور اجرا کنید:

```bash
curl "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip="
```

برای آپدیت خودکار هر 5 دقیقه:

```bash
crontab -e
```

این خط را اضافه کنید:
```
*/5 * * * * curl -fs "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip=" >/dev/null
```

---

## نکات مهم

- این **بهترین روش کلی** است
- از DPI، فیلتر SNI، و Active Probing عبور می‌کند
- گواهی معتبر مرورگر دارد
- سخت‌ترین برای فیلتر شدن
- نیاز به کلاینت V2Ray/VLESS دارد
- دامنه و UUID را ایمن نگه دارید

---

## خلاصه نهایی

| سوال | پاسخ |
|------|------|
| کاملاً رایگان؟ | ✅ بله |
| سخت برای فیلتر شدن؟ | ✅ بسیار سخت |
| مناسب سانسور شدید؟ | ✅ بله |
| نیاز به دامنه؟ | ✅ بله (DuckDNS رایگان) |

---

=====================================================================

# Layer 7: Real Domain + TLS - Best Overall Method

> **⭐⭐⭐⭐⭐ Best method (hardest to filter)**
> Port 443 - Real TLS tunnel with valid certificate

[← Back to main guide](../README.md)

---

## What is this method?

This method uses a **real domain** and **valid TLS certificate**.
Your traffic looks exactly like a normal HTTPS website.

**Why it's the best:**
- Real domain
- Valid TLS certificate (Let's Encrypt)
- Natural TLS fingerprint
- No obvious proxy signatures

**Result:** Traffic is indistinguishable from normal web browsing.

**Security:** ⭐⭐⭐⭐⭐
**Stealth:** ⭐⭐⭐⭐⭐
**Speed:** ⭐⭐⭐⭐☆

---

## Main Requirement: Domain

You need a domain for this method.

**Option 1: DuckDNS (free and recommended)**
- Completely free
- Easy to set up
- You get a subdomain (e.g., myproxy.duckdns.org)

**Option 2: Paid domain**
- Buy from any domain registrar
- Full control
- More professional

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
- Server IP (write this down!)
- Username: root
- Password

<img width="1182" height="1387" alt="Server Info" src="https://github.com/user-attachments/assets/8cf364c3-a090-4f20-b496-ab45ed2f3659" />

---

--------------------------------------------------
Step 2: Get Free Domain (DuckDNS)
--------------------------------------------------

### Step 1: Sign up on DuckDNS

Go to: https://duckdns.org

Login with GitHub or Google.

### Step 2: Create Subdomain

Choose a name (e.g.):
```
myproxy123.duckdns.org
```

Enter your IONOS server IP in the IP box.

Copy your TOKEN (keep it safe).

---

--------------------------------------------------
Step 3: SSH Connection
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
Step 4: Install Layer 7 (Real Domain + TLS)
--------------------------------------------------

Run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer7-real-domain/install.sh -o install.sh && bash install.sh
```

**During installation you'll be asked:**
1. Your domain (e.g.: myproxy123.duckdns.org)
2. Your email (for Let's Encrypt)

The script will:
- Obtain valid TLS certificate
- Set up VLESS/Trojan on port 443
- Prepare everything

**After installation you'll receive:**
- User UUID
- Subscription link
- QR Code

---

--------------------------------------------------
Step 5: Add New User
--------------------------------------------------

Create a user for each person:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/add-user.sh -o add-user.sh && bash add-user.sh
```

---

--------------------------------------------------
Step 6: Delete User (if needed)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/common/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

---

## iOS Usage (V2Box or Shadowrocket)

### Step 1: Install App

Install one of these from App Store:
- **V2Box** (free)
- **Shadowrocket** (paid but better)

### Step 2: Add Config

**Method 1: Scan QR Code (easier)**
- In app, tap + or Scan
- Scan the QR code shown on server

**Method 2: Copy Link**
- Copy the VLESS/Trojan link you received after installation
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
- Copy the link
- In app, tap +
- Select "Import config from clipboard"

### Step 3: Connect

Tap on config and press connect button.

✅ Connected successfully!

---

## Auto DNS Update (optional)

If server IP changes, run this on server:

```bash
curl "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip="
```

For automatic update every 5 minutes:

```bash
crontab -e
```

Add this line:
```
*/5 * * * * curl -fs "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip=" >/dev/null
```

---

## Important Notes

- This is the **best overall method**
- Passes DPI, SNI filtering, and Active Probing
- Has valid browser certificate
- Hardest to filter
- Requires V2Ray/VLESS client
- Keep domain and UUID secure

---

## Final Summary

| Question | Answer |
|----------|--------|
| Fully free? | ✅ YES |
| Hard to block? | ✅ VERY |
| Suitable for hard censorship? | ✅ YES |
| Need domain? | ✅ YES (DuckDNS is free) |

---

**Made with ❤️ for internet freedom**
