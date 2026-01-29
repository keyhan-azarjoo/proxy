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
مرحله ۱: خرید سرور VPS
--------------------------------------------------

**اگر از قبل سرور لینوکس با Ubuntu دارید، این مرحله را رد کنید و به مرحله ۲ بروید.**

**برای خرید از IONOS (پیشنهادی):** [راهنمای خرید سرور از IONOS](../buy-ionos-server.md)

### نکات خرید:
- سیستم‌عامل: **Ubuntu**
- پلن ارزان کافی است
- لوکیشن به انتخاب شما

**اطلاعات مورد نیاز از سرور:**
- IP سرور (این را یادداشت کنید!)
- نام کاربری: root
- رمز عبور

---

--------------------------------------------------
مرحله ۲: دریافت دامنه رایگان (DuckDNS)
--------------------------------------------------

**برای راهنمای کامل با تصویر:** [راهنمای دریافت دامنه رایگان از DuckDNS](../get-free-domain.md)

### خلاصه مراحل:

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

**[راهنمای اتصال به سرور با SSH](../ssh-connection.md)**

خلاصه:
```bash
ssh root@SERVER-IP
```

---

--------------------------------------------------
مرحله ۴: نصب لایه ۷ (دامنه واقعی + TLS)
--------------------------------------------------

این دستور را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/install.sh -o install.sh && bash install.sh
```

**در طول نصب از شما پرسیده می‌شود:**
1. دامنه شما (مثلاً: myproxy123.duckdns.org)
2. ایمیل شما (برای Let's Encrypt)
<img width="1178" height="602" alt="Screenshot 2026-01-29 094843" src="https://github.com/user-attachments/assets/6a295b18-3915-417e-9837-de77eee0db0c" />


اسکریپت:
- گواهی TLS معتبر می‌گیرد
- VLESS روی پورت 443 راه‌اندازی می‌کند
- همه چیز را آماده می‌کند

---

--------------------------------------------------
مرحله ۵: اضافه کردن کاربر
--------------------------------------------------

برای هر نفر یک کاربر بسازید. بعد از اضافه کردن کاربر، **۲ کانفیگ JSON** نمایش داده می‌شود:
- کانفیگ iOS (برای NPV Tunnel)
- کانفیگ Android (برای NetMod)

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/add-user.sh -o add-user.sh && bash add-user.sh
```
<img width="1541" height="1327" alt="Screenshot 2026-01-29 095609" src="https://github.com/user-attachments/assets/d4a840bc-25f9-4347-a9b0-6bc1998f060c" />

**توجه:** اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ قبلی برگردانده می‌شود.

---

--------------------------------------------------
مرحله ۶: مانیتورینگ کاربران
--------------------------------------------------

برای مشاهده کاربران متصل و وضعیت سرور:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/view-users.sh -o view-users.sh && bash view-users.sh
```

---

--------------------------------------------------
مرحله ۷: حذف کاربر (در صورت نیاز)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

بعد از حذف، کاربر دیگر نمی‌تواند با کانفیگ قبلی متصل شود.

---

## استفاده در iOS

[راهنمای اتصال با iOS (NPV Tunnel)](./iOS-SETUP.md)

---

## استفاده در Android

[راهنمای اتصال با Android (NetMod)](./ANDROID-SETUP.md)

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
- برای iOS: NPV Tunnel
- برای Android: NetMod
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
Step 1: Purchase VPS Server
--------------------------------------------------

**If you already have a Linux server with Ubuntu, skip this step and go to Step 2.**

**To purchase from IONOS (recommended):** [Guide to Purchasing Server from IONOS](../buy-ionos-server.md)

### Purchase notes:
- Operating system: **Ubuntu**
- Cheap plan is sufficient
- Location is your choice

**Required information from server:**
- Server IP (write this down!)
- Username: root
- Password

---

--------------------------------------------------
Step 2: Get Free Domain (DuckDNS)
--------------------------------------------------

**For full guide with screenshots:** [Guide to Getting a Free Domain from DuckDNS](../get-free-domain.md)

### Summary:

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

**[Guide to Connecting to Server with SSH](../ssh-connection.md)**

Summary:
```bash
ssh root@SERVER-IP
```

---

--------------------------------------------------
Step 4: Install Layer 7 (Real Domain + TLS)
--------------------------------------------------

Run this command:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/install.sh -o install.sh && bash install.sh
```

**During installation you'll be asked:**
1. Your domain (e.g.: myproxy123.duckdns.org)
2. Your email (for Let's Encrypt)
   
<img width="1178" height="602" alt="Screenshot 2026-01-29 094843" src="https://github.com/user-attachments/assets/5818b2e8-8752-477b-834f-0679423c47ce" />


The script will:
- Obtain valid TLS certificate
- Set up VLESS on port 443
- Prepare everything

---

--------------------------------------------------
Step 5: Add User
--------------------------------------------------

Create a user for each person. After adding a user, **2 JSON configs** will be displayed:
- iOS config (for NPV Tunnel)
- Android config (for NetMod)

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/add-user.sh -o add-user.sh && bash add-user.sh
```
<img width="1541" height="1327" alt="Screenshot 2026-01-29 095609" src="https://github.com/user-attachments/assets/3a4b8512-2ebe-424c-8499-ad7025872d2f" />

**Note:** If you add the same username again, the same config will be returned.

---

--------------------------------------------------
Step 6: Monitor Users
--------------------------------------------------

To view connected users and server status:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/common/view-users.sh -o view-users.sh && bash view-users.sh
```

---

--------------------------------------------------
Step 7: Delete User (if needed)
--------------------------------------------------

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/delete-user.sh -o delete-user.sh && bash delete-user.sh username
```

After deletion, the user can no longer connect with their previous config.

---

## iOS Usage

[iOS Connection Guide (NPV Tunnel)](./iOS-SETUP.md)

---

## Android Usage

[Android Connection Guide (NetMod)](./ANDROID-SETUP.md)

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
- For iOS: NPV Tunnel
- For Android: NetMod
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



