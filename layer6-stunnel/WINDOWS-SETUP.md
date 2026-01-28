# راهنمای اتصال با Windows - لایه ۶ (Stunnel)

[← بازگشت به راهنمای اصلی لایه ۶](./README.md)

---

## روش استفاده از PowerShell

### مرحله ۱: باز کردن PowerShell

روی دکمه Start کلیک راست کرده و **PowerShell** را انتخاب کنید.

### مرحله ۲: اتصال SSH با SOCKS Proxy

```powershell
ssh -D 1080 -N username@SERVER-IP -p 443
```

**توجه:** پورت **443** برای لایه ۶ - امنیت دوبل SSH + TLS

### مرحله ۳: تنظیم مرورگر

#### Firefox:
Settings → Network Settings → Manual proxy → SOCKS5: `127.0.0.1:1080`

#### Chrome:
استفاده از افزونه **Proxy SwitchyOmega**

✅ اتصال برقرار شد!

---

## نکات مهم

- این روش رمزنگاری دوبل دارد (SSH + TLS)
- امن‌تر از لایه ۴
- پنجره PowerShell باید باز بماند

---

=====================================================================

# Windows Connection Guide - Layer 6 (Stunnel)

[← Back to Layer 6 Main Guide](./README.md)

---

## Method Using PowerShell

### Step 1: Open PowerShell

Right-click Start and select **PowerShell**.

### Step 2: Connect SSH with SOCKS Proxy

```powershell
ssh -D 1080 -N username@SERVER-IP -p 443
```

**Note:** Port **443** for Layer 6 - Double security SSH + TLS

### Step 3: Configure Browser

#### Firefox:
Settings → Network Settings → Manual proxy → SOCKS5: `127.0.0.1:1080`

#### Chrome:
Use **Proxy SwitchyOmega** extension

✅ Connected successfully!

---

## Important Notes

- This method has double encryption (SSH + TLS)
- More secure than Layer 4
- PowerShell window must remain open

---

**Made with ❤️ for internet freedom**
