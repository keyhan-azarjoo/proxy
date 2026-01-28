# راهنمای اتصال با Windows - لایه ۴ (Nginx)

[← بازگشت به راهنمای اصلی لایه ۴](./README.md)

---

## روش ۱: استفاده از PowerShell (ویندوز ۱۰ و بالاتر)

### مرحله ۱: باز کردن PowerShell

روی دکمه Start کلیک راست کرده و **PowerShell** را انتخاب کنید.

### مرحله ۲: اتصال SSH با SOCKS Proxy

دستور زیر را اجرا کنید:

```powershell
ssh -D 1080 -N username@SERVER-IP -p 443
```

**توجه:**
- `username` را با نام کاربری خود جایگزین کنید
- `SERVER-IP` را با IP سرور خود جایگزین کنید
- پورت `443` برای لایه ۴ (HTTPS)

مثال:
```powershell
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 443
```

رمز عبور را وارد کنید.

### مرحله ۳: تنظیم مرورگر

#### برای Firefox:
1. Settings → Network Settings
2. Manual proxy configuration
3. SOCKS Host: `127.0.0.1`
4. Port: `1080`
5. SOCKS v5 را انتخاب کنید

#### برای Chrome:
از افزونه **Proxy SwitchyOmega** استفاده کنید:
1. نصب کنید از Chrome Web Store
2. New Profile → Proxy Profile
3. Protocol: SOCKS5
4. Server: `127.0.0.1`
5. Port: `1080`

✅ اتصال برقرار شد!

---

## روش ۲: استفاده از PuTTY

### مرحله ۱: دانلود و نصب

از لینک زیر PuTTY را دانلود کنید:
https://www.putty.org/

### مرحله ۲: تنظیمات اتصال

1. **Host Name**: `username@SERVER-IP`
2. **Port**: `443`
3. به منوی **Connection → SSH → Tunnels** بروید
4. **Source port**: `1080`
5. **Destination**: خالی بگذارید
6. **Dynamic** را انتخاب کنید
7. روی **Add** کلیک کنید
8. برگردید به **Session** و روی **Open** کلیک کنید

رمز عبور را وارد کنید.

### مرحله ۳: تنظیم مرورگر

مثل روش ۱، مرورگر را تنظیم کنید که از `127.0.0.1:1080` استفاده کند.

---

## نکات مهم

- پنجره PowerShell یا PuTTY باید باز بماند
- پورت **443** شبیه HTTPS است و فیلتر شدن آن سخت‌تر است
- این روش برای استفاده روزمره توصیه می‌شود

---

=====================================================================

# Windows Connection Guide - Layer 4 (Nginx)

[← Back to Layer 4 Main Guide](./README.md)

---

## Method 1: Using PowerShell (Windows 10 and above)

### Step 1: Open PowerShell

Right-click Start button and select **PowerShell**.

### Step 2: Connect SSH with SOCKS Proxy

Run this command:

```powershell
ssh -D 1080 -N username@SERVER-IP -p 443
```

**Note:**
- Replace `username` with your username
- Replace `SERVER-IP` with your server IP
- Port `443` for Layer 4 (HTTPS)

Example:
```powershell
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 443
```

Enter your password.

### Step 3: Configure Browser

#### For Firefox:
1. Settings → Network Settings
2. Manual proxy configuration
3. SOCKS Host: `127.0.0.1`
4. Port: `1080`
5. Select SOCKS v5

#### For Chrome:
Use **Proxy SwitchyOmega** extension:
1. Install from Chrome Web Store
2. New Profile → Proxy Profile
3. Protocol: SOCKS5
4. Server: `127.0.0.1`
5. Port: `1080`

✅ Connected successfully!

---

## Method 2: Using PuTTY

### Step 1: Download and Install

Download PuTTY from:
https://www.putty.org/

### Step 2: Connection Settings

1. **Host Name**: `username@SERVER-IP`
2. **Port**: `443`
3. Go to **Connection → SSH → Tunnels**
4. **Source port**: `1080`
5. **Destination**: Leave empty
6. Select **Dynamic**
7. Click **Add**
8. Return to **Session** and click **Open**

Enter your password.

### Step 3: Configure Browser

Like Method 1, configure browser to use `127.0.0.1:1080`.

---

## Important Notes

- PowerShell or PuTTY window must remain open
- Port **443** looks like HTTPS and is harder to filter
- This method is recommended for daily use

---

**Made with ❤️ for internet freedom**
