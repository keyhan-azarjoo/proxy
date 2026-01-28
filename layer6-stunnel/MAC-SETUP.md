# راهنمای اتصال با macOS - لایه ۶ (Stunnel)

[← بازگشت به راهنمای اصلی لایه ۶](./README.md)

---

## مرحله ۱: باز کردن Terminal

از Spotlight (Cmd+Space) جستجو کنید: **Terminal**

---

## مرحله ۲: اتصال SSH

```bash
ssh -D 1080 -N username@SERVER-IP -p 443
```

**توجه:** پورت **443** برای لایه ۶ - امنیت دوبل SSH + TLS

---

## مرحله ۳: تنظیم پراکسی

**System Preferences** → **Network** → شبکه فعلی → **Advanced** → **Proxies**

- **SOCKS Proxy**: `127.0.0.1:1080`

یا فقط مرورگر:
- Firefox: Network Settings → SOCKS5: `127.0.0.1:1080`
- Chrome: افزونه **Proxy SwitchyOmega**

✅ اتصال برقرار شد!

---

## نکات مهم

- این روش رمزنگاری دوبل دارد (SSH + TLS)
- امن‌تر از لایه ۴
- Terminal باید باز بماند

---

=====================================================================

# macOS Connection Guide - Layer 6 (Stunnel)

[← Back to Layer 6 Main Guide](./README.md)

---

## Step 1: Open Terminal

From Spotlight (Cmd+Space) search: **Terminal**

---

## Step 2: Connect SSH

```bash
ssh -D 1080 -N username@SERVER-IP -p 443
```

**Note:** Port **443** for Layer 6 - Double security SSH + TLS

---

## Step 3: Configure Proxy

**System Preferences** → **Network** → Current network → **Advanced** → **Proxies**

- **SOCKS Proxy**: `127.0.0.1:1080`

Or browser only:
- Firefox: Network Settings → SOCKS5: `127.0.0.1:1080`
- Chrome: **Proxy SwitchyOmega** extension

✅ Connected successfully!

---

## Important Notes

- This method has double encryption (SSH + TLS)
- More secure than Layer 4
- Terminal must remain open

---

**Made with ❤️ for internet freedom**
