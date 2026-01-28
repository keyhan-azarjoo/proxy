# راهنمای اتصال با Linux - لایه ۳ (SSH پایه)

[← بازگشت به راهنمای اصلی لایه ۳](./README.md)

---

## مرحله ۱: باز کردن Terminal

Terminal را در سیستم خود باز کنید.

---

## مرحله ۲: اتصال SSH با SOCKS Proxy

دستور زیر را اجرا کنید:

```bash
ssh -D 1080 -N username@SERVER-IP -p 22
```

**توجه:**
- `username` را با نام کاربری خود جایگزین کنید
- `SERVER-IP` را با IP سرور خود جایگزین کنید
- پورت `22` برای لایه ۳

مثال:
```bash
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 22
```

رمز عبور را وارد کنید.

پنجره Terminal را باز نگه دارید.

---

## مرحله ۳: تنظیم پراکسی

### روش ۱: تنظیمات سیستم (GNOME/Ubuntu)

برای دسکتاپ GNOME:

```bash
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 1080
```

یا از GUI:
1. **Settings** → **Network**
2. **Network Proxy** → **Manual**
3. **Socks Host**: `127.0.0.1`, Port: `1080`

برای غیرفعال کردن:
```bash
gsettings set org.gnome.system.proxy mode 'none'
```

---

### روش ۲: متغیرهای محیطی (Environment Variables)

برای تنظیم موقت در Terminal فعلی:

```bash
export ALL_PROXY=socks5://127.0.0.1:1080
export HTTP_PROXY=socks5://127.0.0.1:1080
export HTTPS_PROXY=socks5://127.0.0.1:1080
```

برای تنظیم دائمی، به فایل `~/.bashrc` یا `~/.zshrc` اضافه کنید:

```bash
echo 'export ALL_PROXY=socks5://127.0.0.1:1080' >> ~/.bashrc
echo 'export HTTP_PROXY=socks5://127.0.0.1:1080' >> ~/.bashrc
echo 'export HTTPS_PROXY=socks5://127.0.0.1:1080' >> ~/.bashrc
source ~/.bashrc
```

---

### روش ۳: فقط مرورگر (Firefox)

1. Firefox → **Preferences**
2. **Network Settings** → **Settings**
3. **Manual proxy configuration**
4. **SOCKS Host**: `127.0.0.1`
5. **Port**: `1080`
6. **SOCKS v5** را انتخاب کنید

---

### روش ۴: Chrome/Chromium

Chrome را با پارامتر proxy-server اجرا کنید:

```bash
google-chrome --proxy-server="socks5://127.0.0.1:1080"
```

یا از افزونه **Proxy SwitchyOmega** استفاده کنید.

---

## نکات مهم

- پنجره Terminal باید باز بماند (یا از `-f` استفاده کنید)
- برای قطع اتصال: Ctrl+C
- پورت `1080` باید آزاد باشد

---

## نکته پیشرفته: اجرای در Background

برای اجرا در background:

```bash
ssh -D 1080 -N -f username@SERVER-IP -p 22
```

برای قطع اتصال:
```bash
ps aux | grep "ssh -D 1080"
kill [PID]
```

یا:
```bash
pkill -f "ssh -D 1080"
```

---

## تست اتصال

بررسی IP شما:

```bash
curl --socks5 127.0.0.1:1080 https://ipinfo.io/ip
```

باید IP سرور VPS را نشان دهد.

---

## استفاده با curl

```bash
curl --socks5 127.0.0.1:1080 https://example.com
```

---

## استفاده با wget

```bash
wget -e use_proxy=yes -e socks_proxy=127.0.0.1:1080 https://example.com
```

---

=====================================================================

# Linux Connection Guide - Layer 3 (Basic SSH)

[← Back to Layer 3 Main Guide](./README.md)

---

## Step 1: Open Terminal

Open Terminal on your system.

---

## Step 2: Connect SSH with SOCKS Proxy

Run this command:

```bash
ssh -D 1080 -N username@SERVER-IP -p 22
```

**Note:**
- Replace `username` with your username
- Replace `SERVER-IP` with your server IP
- Port `22` for Layer 3

Example:
```bash
ssh -D 1080 -N myuser@185.xxx.xxx.xxx -p 22
```

Enter your password.

Keep the Terminal window open.

---

## Step 3: Configure Proxy

### Method 1: System Settings (GNOME/Ubuntu)

For GNOME desktop:

```bash
gsettings set org.gnome.system.proxy mode 'manual'
gsettings set org.gnome.system.proxy.socks host '127.0.0.1'
gsettings set org.gnome.system.proxy.socks port 1080
```

Or via GUI:
1. **Settings** → **Network**
2. **Network Proxy** → **Manual**
3. **Socks Host**: `127.0.0.1`, Port: `1080`

To disable:
```bash
gsettings set org.gnome.system.proxy mode 'none'
```

---

### Method 2: Environment Variables

For temporary setup in current Terminal:

```bash
export ALL_PROXY=socks5://127.0.0.1:1080
export HTTP_PROXY=socks5://127.0.0.1:1080
export HTTPS_PROXY=socks5://127.0.0.1:1080
```

For permanent setup, add to `~/.bashrc` or `~/.zshrc`:

```bash
echo 'export ALL_PROXY=socks5://127.0.0.1:1080' >> ~/.bashrc
echo 'export HTTP_PROXY=socks5://127.0.0.1:1080' >> ~/.bashrc
echo 'export HTTPS_PROXY=socks5://127.0.0.1:1080' >> ~/.bashrc
source ~/.bashrc
```

---

### Method 3: Browser Only (Firefox)

1. Firefox → **Preferences**
2. **Network Settings** → **Settings**
3. **Manual proxy configuration**
4. **SOCKS Host**: `127.0.0.1`
5. **Port**: `1080`
6. Select **SOCKS v5**

---

### Method 4: Chrome/Chromium

Run Chrome with proxy-server parameter:

```bash
google-chrome --proxy-server="socks5://127.0.0.1:1080"
```

Or use **Proxy SwitchyOmega** extension.

---

## Important Notes

- Terminal window must remain open (or use `-f`)
- To disconnect: Ctrl+C
- Port `1080` must be free

---

## Advanced Tip: Run in Background

To run in background:

```bash
ssh -D 1080 -N -f username@SERVER-IP -p 22
```

To disconnect:
```bash
ps aux | grep "ssh -D 1080"
kill [PID]
```

Or:
```bash
pkill -f "ssh -D 1080"
```

---

## Test Connection

Check your IP:

```bash
curl --socks5 127.0.0.1:1080 https://ipinfo.io/ip
```

Should show your VPS server IP.

---

## Using with curl

```bash
curl --socks5 127.0.0.1:1080 https://example.com
```

---

## Using with wget

```bash
wget -e use_proxy=yes -e socks_proxy=127.0.0.1:1080 https://example.com
```

---

**Made with ❤️ for internet freedom**
