# راهنمای اتصال با Linux - لایه ۶ (Stunnel)

[← بازگشت به راهنمای اصلی لایه ۶](./README.md)

---

## مرحله ۱: باز کردن Terminal

Terminal را باز کنید.

---

## مرحله ۲: اتصال SSH

```bash
ssh -D 1080 -N username@SERVER-IP -p 443
```

**توجه:** پورت **443** برای لایه ۶ - امنیت دوبل SSH + TLS

---

## مرحله ۳: تنظیم پراکسی

### تنظیمات سیستم (GNOME):
```bash
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 1080
```

### متغیرهای محیطی:
```bash
export ALL_PROXY=socks5://127.0.0.1:1080
export HTTP_PROXY=socks5://127.0.0.1:1080
export HTTPS_PROXY=socks5://127.0.0.1:1080
```

### فقط مرورگر:
Firefox: Preferences → Network Settings → SOCKS5: `127.0.0.1:1080`

✅ اتصال برقرار شد!

---

## نکات مهم

- این روش رمزنگاری دوبل دارد (SSH + TLS)
- امن‌تر از لایه ۴
- Terminal باید باز بماند (یا از `-f` استفاده کنید)

---

=====================================================================

# Linux Connection Guide - Layer 6 (Stunnel)

[← Back to Layer 6 Main Guide](./README.md)

---

## Step 1: Open Terminal

Open Terminal.

---

## Step 2: Connect SSH

```bash
ssh -D 1080 -N username@SERVER-IP -p 443
```

**Note:** Port **443** for Layer 6 - Double security SSH + TLS

---

## Step 3: Configure Proxy

### System Settings (GNOME):
```bash
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 1080
```

### Environment Variables:
```bash
export ALL_PROXY=socks5://127.0.0.1:1080
export HTTP_PROXY=socks5://127.0.0.1:1080
export HTTPS_PROXY=socks5://127.0.0.1:1080
```

### Browser Only:
Firefox: Preferences → Network Settings → SOCKS5: `127.0.0.1:1080`

✅ Connected successfully!

---

## Important Notes

- This method has double encryption (SSH + TLS)
- More secure than Layer 4
- Terminal must remain open (or use `-f`)

---

**Made with ❤️ for internet freedom**
