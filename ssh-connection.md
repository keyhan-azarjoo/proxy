# راهنمای اتصال به سرور با SSH

[← صفحه قبلی: خرید سرور](./buy-ionos-server.md) | [← بازگشت به راهنمای اصلی](./README.md)

---

## SSH چیست؟

SSH (Secure Shell) یک پروتکل امن برای اتصال از راه دور به سرور است. با SSH می‌توانید دستورات را روی سرور اجرا کنید.

---

--------------------------------------------------
مرحله ۱: نصب ترمینال مناسب
--------------------------------------------------

### ویندوز:
- **PowerShell** (از قبل نصب است)
- یا [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701) از Microsoft Store

### مک:
- **Terminal** (از قبل نصب است)
- در Applications → Utilities → Terminal

### لینوکس:
- **Terminal** (از قبل نصب است)

---

--------------------------------------------------
مرحله ۲: اتصال به سرور
--------------------------------------------------

ترمینال را باز کنید و دستور زیر را وارد کنید:

```bash
ssh root@IP_ADDRESS
```

به جای `IP_ADDRESS` آدرس IP سرور خود را بگذارید.

**مثال:**
```bash
ssh root@185.234.72.101
```

---

--------------------------------------------------
مرحله ۳: تأیید اتصال اولیه
--------------------------------------------------

در اولین اتصال، پیامی مشابه زیر می‌بینید:

```
The authenticity of host '185.234.72.101' can't be established.
ED25519 key fingerprint is SHA256:xxxxxxxxxxxxxxxxxxxxx
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

**تایپ کنید:** `yes` و Enter بزنید.

---

--------------------------------------------------
مرحله ۴: وارد کردن رمز عبور
--------------------------------------------------

رمز عبور سرور را وارد کنید.

**توجه:** هنگام تایپ رمز، چیزی نمایش داده نمی‌شود. این طبیعی است. فقط تایپ کنید و Enter بزنید.

اگر همه چیز درست باشد، وارد سرور می‌شوید و چیزی شبیه این می‌بینید:

```
root@vps12345:~#
```

**تبریک!** شما الان به سرور متصل هستید.

---

## رفع مشکلات رایج

### خطای "Connection refused"
- سرور روشن نیست یا SSH فعال نیست
- IP اشتباه است

### خطای "Connection timed out"
- فایروال جلوی اتصال را گرفته
- IP اشتباه است

### خطای "Permission denied"
- رمز عبور اشتباه است
- نام کاربری اشتباه است

### خطای "Host key verification failed" یا "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED"

این خطا زمانی رخ می‌دهد که سرور را ریست کرده‌اید یا مجدداً نصب کرده‌اید.

**راه حل:** این دستور را روی کامپیوتر خود اجرا کنید:

```bash
ssh-keygen -R SERVER-IP
```

مثال:
```bash
ssh-keygen -R 87.106.68.203
```

سپس دوباره با SSH وصل شوید.

---

## مرحله بعد

اکنون که به سرور متصل شدید، به راهنمای اصلی برگردید و روش نصب مورد نظر خود را انتخاب کنید:

- [← بازگشت به راهنمای اصلی](./README.md)

یا مستقیماً به روش نصب مورد نظر بروید:
- [لایه ۳: SSH پایه](./layer3-basic/README.md)
- [لایه ۴: Nginx (پیشنهادی)](./layer4-nginx/README.md)
- [لایه ۶: Stunnel](./layer6-stunnel/README.md)
- [لایه ۷: V2Ray VMess](./layer7-v2ray-vmess/README.md)
- [لایه ۷: دامنه واقعی](./layer7-real-domain/README.md)

---

=====================================================================

# Guide to Connecting to Server with SSH

[← Previous: Buy Server](./buy-ionos-server.md) | [← Back to main guide](./README.md)

---

## What is SSH?

SSH (Secure Shell) is a secure protocol for remote connection to a server. With SSH, you can execute commands on the server.

---

--------------------------------------------------
Step 1: Install Appropriate Terminal
--------------------------------------------------

### Windows:
- **PowerShell** (pre-installed)
- Or [Windows Terminal](https://apps.microsoft.com/store/detail/windows-terminal/9N0DX20HK701) from Microsoft Store

### Mac:
- **Terminal** (pre-installed)
- In Applications → Utilities → Terminal

### Linux:
- **Terminal** (pre-installed)

---

--------------------------------------------------
Step 2: Connect to Server
--------------------------------------------------

Open the terminal and enter the following command:

```bash
ssh root@IP_ADDRESS
```

Replace `IP_ADDRESS` with your server's IP address.

**Example:**
```bash
ssh root@185.234.72.101
```

---

--------------------------------------------------
Step 3: Confirm Initial Connection
--------------------------------------------------

On the first connection, you will see a message similar to this:

```
The authenticity of host '185.234.72.101' can't be established.
ED25519 key fingerprint is SHA256:xxxxxxxxxxxxxxxxxxxxx
Are you sure you want to continue connecting (yes/no/[fingerprint])?
```

**Type:** `yes` and press Enter.

---

--------------------------------------------------
Step 4: Enter Password
--------------------------------------------------

Enter the server password.

**Note:** When typing the password, nothing is displayed. This is normal. Just type and press Enter.

If everything is correct, you will enter the server and see something like this:

```
root@vps12345:~#
```

**Congratulations!** You are now connected to the server.

---

## Troubleshooting Common Issues

### "Connection refused" Error
- Server is not running or SSH is not enabled
- IP is incorrect

### "Connection timed out" Error
- Firewall is blocking the connection
- IP is incorrect

### "Permission denied" Error
- Password is incorrect
- Username is incorrect

### "Host key verification failed" or "WARNING: REMOTE HOST IDENTIFICATION HAS CHANGED" Error

This error occurs when you have reset the server or reinstalled it.

**Solution:** Run this command on your computer:

```bash
ssh-keygen -R SERVER-IP
```

Example:
```bash
ssh-keygen -R 87.106.68.203
```

Then connect with SSH again.

---

## Next Step

Now that you are connected to the server, return to the main guide and choose your preferred installation method:

- [← Back to main guide](./README.md)

Or go directly to your preferred installation method:
- [Layer 3: Basic SSH](./layer3-basic/README.md)
- [Layer 4: Nginx (Recommended)](./layer4-nginx/README.md)
- [Layer 6: Stunnel](./layer6-stunnel/README.md)
- [Layer 7: V2Ray VMess](./layer7-v2ray-vmess/README.md)
- [Layer 7: Real Domain](./layer7-real-domain/README.md)

---

**Made with love for internet freedom**
