# 📗 لایه ۴: پروکسی TCP با Nginx

> **⭐ توصیه می‌شود برای اکثر کاربران** • پورت 443 (HTTPS) • نصب آسان • قابل اعتماد

[← بازگشت به راهنمای اصلی](../README.md)

---

## 📖 لایه ۴ چیست؟

لایه ۴ از Nginx برای انتقال ترافیک از پورت 443 (پورت HTTPS) به سرور SSH شما استفاده می‌کند. این کار باعث می‌شود ترافیک پروکسی شما شبیه ترافیک معمولی HTTPS به نظر برسد و مسدود کردن آن بسیار سخت‌تر شود.

### ✅ مزایا
- 🌟 **بهترین تعادل بین سادگی و مخفی‌سازی** - برای اکثر کاربران توصیه می‌شود
- 🔐 **استفاده از پورت 443** - پورت استاندارد HTTPS (به ندرت مسدود می‌شود)
- 👀 **تشخیص دشوارتر** - شبیه ترافیک معمولی HTTPS است
- ⚡ **سریع و قابل اعتماد** - Nginx آزمایش شده و پایدار است
- 🛡️ **رمزگذاری SSH** - امنیت مشابه لایه ۳
- 📱 **با تمام کلاینت‌های SSH کار می‌کند** - سازگاری کامل

### ⚠️ محدودیت‌ها
- ⚙️ **نصب کمی پیچیده‌تر** - نیاز به نصب Nginx دارد
- 🚫 **Apache/Plesk را غیرفعال می‌کند** - امکان اجرای وب‌سرور روی پورت 443 وجود ندارد
- 🔍 **ممکن است DPI آن را تشخیص دهد** - بازرسی پیشرفته می‌تواند SSH را شناسایی کند

---

## 🎯 مناسب برای

- 🌍 **اکثر کاربران** - بهترین انتخاب همه‌منظوره
- 🏢 **شبکه‌های شرکتی** - پورت 443 معمولاً باز است
- ✈️ **مسافرت** - پورت 443 تقریباً همه‌جا کار می‌کند
- 🔒 **سانسور سبک** - فیلترینگ پایه را دور می‌زند
- 💼 **استفاده روزانه** - قابل اعتماد و پرسرعت

**⭐ این انتخاب شماره یک ماست!**

---

## 🚀 نصب (آسان!)

### مرحله ۱: اتصال به سرور مجازی

در **Windows** (PowerShell/CMD):
```cmd
ssh root@YOUR_SERVER_IP
```

در **Mac/Linux** (Terminal):
```bash
ssh root@YOUR_SERVER_IP
```

### مرحله ۲: اجرای نصب

این دستور را کپی و اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer4-nginx/install.sh -o install.sh && bash install.sh
```

یا اگر مخزن را کلون کرده‌اید:

```bash
cd ssh-socks-proxy/layer4-nginx
bash install.sh
```

### مرحله ۳: تایید نصب

نصب‌کننده این کارها را انجام می‌دهد:
1. ✅ بررسی سیستم شما
2. ⚠️ **هشدار درباره غیرفعال‌سازی Apache/Plesk** (در صورت اجرا)
3. 📦 نصب Nginx و وابستگی‌ها
4. ⚙️ پیکربندی SSH و Nginx
5. 🔥 پیکربندی فایروال
6. ✅ نمایش جزئیات اتصال

**⚠️ مهم:** اگر از سرور مجازی خود برای وب‌سایت روی پورت 443 استفاده می‌کنید، این کار آن را غیرفعال می‌کند!

**زمان کل: ۵-۷ دقیقه**

---

## 👤 افزودن کاربر

پس از نصب، برای اتصال باید کاربر ایجاد کنید:

### حالت تعاملی (توصیه می‌شود)
```bash
cd ../common
bash add-user.sh
```

دستورالعمل‌ها را برای نام کاربری و رمز عبور دنبال کنید.

### حالت سریع
```bash
cd ../common
bash add-user.sh myusername mypassword
```

---

## 📱 اتصال از دستگاه‌های شما

### iPhone/iPad (NPV Tunnel)

1. **دانلود:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **روی "+" بزنید تا اتصال جدید اضافه کنید**
3. **"SSH" را انتخاب کنید** (نه SSH+SSL)
4. **جزئیات را وارد کنید:**
   - **Name:** My Proxy
   - **Server:** آی‌پی سرور مجازی شما
   - **Port:** `443` ⬅️ **مهم: از 443 استفاده کنید، نه 22**
   - **Username:** از add-user
   - **Password:** از add-user
5. **ذخیره و اتصال** ✅

### Android (Net Mod)

1. **دانلود:** [Net Mod](https://play.google.com/store/apps/details?id=com.netmod.app)
2. **حالت SSH Tunnel**
3. **جزئیات را وارد کنید:**
   - **Server:** آی‌پی سرور مجازی شما
   - **Port:** `443` ⬅️ **از 443 استفاده کنید**
   - **Username:** از add-user
   - **Password:** از add-user
4. **اتصال** ✅

### Windows (PuTTY)

1. **دانلود:** [PuTTY](https://www.putty.org/)
2. **پیکربندی:**
   - **Host:** آی‌پی سرور مجازی شما
   - **Port:** `443` ⬅️ **از 443 استفاده کنید، نه 22**
   - **Connection type:** SSH
3. **Tunnels:**
   - بروید به: Connection → SSH → Tunnels
   - **Source port:** `1080`
   - **Type:** Dynamic
   - روی "Add" کلیک کنید
4. **پروفایل را ذخیره کنید** و **باز کنید**
5. **لاگین کنید** و پنجره را باز نگه دارید

### macOS/Linux (Terminal)

```bash
ssh -p 443 -D 1080 -N username@YOUR_SERVER_IP
```

**نکته:** گزینه `-p 443` به SSH می‌گوید از پورت 443 استفاده کند!

پنجره ترمینال را در هنگام استفاده از پروکسی باز نگه دارید.

---

## 🌐 پیکربندی مرورگر/برنامه‌های شما

پس از اتصال، مرورگر خود را به پروکسی SOCKS محلی هدایت کنید:

### Firefox (توصیه می‌شود)
1. **Settings** → **Network Settings**
2. **Manual proxy configuration**
3. **SOCKS Host:** `127.0.0.1`
4. **Port:** `1080`
5. **SOCKS v5:** ✓
6. **Proxy DNS:** ✓

### Chrome/Edge
1. **Settings** → **System** → **Proxy settings**
2. **SOCKS proxy:** `127.0.0.1:1080`

### پروکسی سیستم‌گستر
- **Windows:** Settings → Network → Proxy → Manual: `127.0.0.1:1080`
- **macOS:** System Preferences → Network → Advanced → Proxies → SOCKS: `127.0.0.1:1080`

---

## 🛠️ دستورات مدیریت

به پوشه common بروید:

```bash
cd /path/to/ssh-socks-proxy/common
```

### افزودن کاربر
```bash
bash add-user.sh
```

### حذف کاربر
```bash
bash delete-user.sh username
```

### لیست کاربران
```bash
bash list-users.sh
```

### بررسی وضعیت
```bash
bash status.sh
```

باید نشان دهد:
- ✅ SSH در حال اجرا روی پورت 22
- ✅ Nginx در حال اجرا و انتقال 443→22

### پشتیبان‌گیری
```bash
bash backup-config.sh
```

### حذف نصب
```bash
bash uninstall.sh
```

---

## 🔧 عیب‌یابی

### نمی‌توانید متصل شوید؟

**1. بررسی کنید سرویس‌ها در حال اجرا هستند:**
```bash
bash status.sh
```

هر دو SSH و Nginx باید "✓ Running" را نشان دهند

**2. بررسی فایروال:**
```bash
ufw status
```

باید نشان دهد:
```
443/tcp    ALLOW
22/tcp     ALLOW
```

**3. تست پورت 443:**
```bash
ss -tulpn | grep :443
```

باید نشان دهد که Nginx روی پورت 443 گوش می‌دهد.

### "Connection refused" روی پورت 443؟

**راه‌اندازی مجدد Nginx:**
```bash
systemctl restart nginx
systemctl status nginx
```

**بررسی پیکربندی Nginx:**
```bash
nginx -t
```

باید بگوید "configuration test successful"

### سرویس‌ها شروع نمی‌شوند؟

**مشاهده لاگ‌های Nginx:**
```bash
journalctl -xe -u nginx
```

**مشاهده لاگ‌های SSH:**
```bash
journalctl -xe -u ssh
```

**بررسی لاگ نصب:**
```bash
tail -50 /var/log/ssh-proxy.log
```

### پورت 443 از قبل در حال استفاده است؟

چیز دیگری از پورت 443 استفاده می‌کند. بررسی کنید:
```bash
ss -tulpn | grep :443
```

نصب باید Apache/Plesk را غیرفعال کرده باشد. اگر نکرده:
```bash
systemctl stop apache2
systemctl disable apache2
systemctl mask apache2
systemctl restart nginx
```

---

## ⚡ نکات بهینه‌سازی

### بهینه‌سازی سرعت

1. **مکان سرور مجازی را با دقت انتخاب کنید**
   - مکانی را انتخاب کنید که از نظر جغرافیایی به شما نزدیک است
   - یا نزدیک به سرویس‌هایی که می‌خواهید به آن‌ها دسترسی داشته باشید

2. **پهنای باند سرور مجازی را بررسی کنید**
   - اکثر سرورهای مجازی ۱-۵ ترابایت در ماه دارند
   - مانیتور مصرف: `vnstat` (با `apt install vnstat` نصب کنید)

3. **بهینه‌سازی SSH**
   - قبلاً توسط اسکریپت ما بهینه شده است
   - به‌طور خودکار از رمزهای سریع استفاده می‌کند

### پایداری اتصال

**برای موبایل (مشکلات خواب/بیداری):**
- "Keep alive" را در کلاینت SSH خود فعال کنید
- NPV Tunnel: "Auto reconnect" را فعال کنید

**برای دسکتاپ:**
به دستور SSH خود اضافه کنید:
```bash
ssh -p 443 -D 1080 -N -o ServerAliveInterval=60 username@YOUR_SERVER_IP
```

---

## 🔄 تغییر از لایه‌های دیگر

اگر لایه ۳ (پایه) را نصب کرده‌اید:

1. **حذف لایه ۳:**
   ```bash
   cd ssh-socks-proxy/common
   bash uninstall.sh
   ```

2. **نصب لایه ۴:**
   ```bash
   cd ../layer4-nginx
   bash install.sh
   ```

3. **ایجاد مجدد کاربران:**
   ```bash
   cd ../common
   bash add-user.sh
   ```

---

## 📊 جزئیات فنی

- **Protocol:** SSH over TCP (via Nginx stream)
- **Port:** 443 (external) → 22 (internal)
- **Proxy:** Nginx stream module
- **Encryption:** SSH (AES-128/256)
- **Authentication:** Password-based
- **Proxy Type:** SOCKS5
- **Multi-user:** Yes (unlimited)

### چگونه کار می‌کند

```
دستگاه شما
    ↓
اتصال به پورت 443 (شبیه HTTPS به نظر می‌رسد)
    ↓
Nginx روی سرور مجازی (پورت 443)
    ↓
انتقال به SSH (پورت 22 محلی)
    ↓
SSH پروکسی SOCKS ایجاد می‌کند
    ↓
اینترنت
```

ناظران شبکه می‌بینند: "ترافیک HTTPS به پورت 443" ✅
واقعیت: تونل پروکسی SSH 🔐

---

## ❓ سوالات متداول

**س: آیا این بهتر از لایه ۳ است؟**
**ج:** بله، برای اکثر افراد. پورت 443 به ندرت مسدود می‌شود و تشخیص آن سخت‌تر است.

**س: آیا می‌توانم وب‌سایت هم داشته باشم؟**
**ج:** نه روی پورت 443. اما می‌توانید از پورت 80 یا پورت‌های دیگر برای وب‌سایت استفاده کنید.

**س: آیا این وب‌سایت موجود من را خراب می‌کند؟**
**ج:** اگر سایت شما از پورت 443 (HTTPS) استفاده می‌کند، بله. از لایه ۳ استفاده کنید یا سایت خود را به پورت دیگری منتقل کنید.

**س: چرا پورت 443؟**
**ج:** این پورت استاندارد HTTPS است. فایروال‌ها به ندرت آن را مسدود می‌کنند و با ترافیک معمولی وب ترکیب می‌شود.

**س: آیا می‌توانم پورت را تغییر دهم؟**
**ج:** بله! `/etc/nginx/stream.d/ssh_443.conf` را ویرایش کنید و `listen 443` را به پورت دیگری تغییر دهید، سپس Nginx را راه‌اندازی مجدد کنید.

**س: این چقدر امن است؟**
**ج:** بسیار امن. رمزگذاری SSH + Nginx ترکیبی اثبات شده است. رمزگذاری مشابه لایه ۳.

---

## 🎓 مراحل بعدی

### ارتقا برای مخفی‌سازی بیشتر

اگر لایه ۴ هنوز مسدود می‌شود:

- **[لایه ۶ (Stunnel)](../layer6-stunnel/README.md)** - رمزگذاری TLS اضافه می‌کند
- **[لایه ۷ (V2Ray)](../layer7-v2ray-vmess/README.md)** - حداکثر مخفی‌سازی

### بیشتر بدانید

- **[راهنمای اصلی](../README.md)** - مقایسه تمام روش‌ها
- **[ابزارهای مدیریت](../README.md#management-commands)** - مدیریت کاربر و سیستم

---

[← بازگشت به راهنمای اصلی](../README.md) | [بعدی: راهنمای لایه ۶ →](../layer6-stunnel/README.md)

**ساخته شده با ❤️ برای آزادی اینترنت**

---

# 📗 Layer 4: Nginx TCP Proxy

> **⭐ RECOMMENDED FOR MOST USERS** • Port 443 (HTTPS) • Easy setup • Reliable

[← Back to main guide](../README.md)

---

## 📖 What is Layer 4?

Layer 4 uses Nginx to forward traffic from port 443 (HTTPS port) to your SSH server. This makes your proxy traffic look like regular HTTPS traffic, making it much harder to block.

### ✅ Advantages
- 🌟 **Best balance of ease and stealth** - Recommended for most users
- 🔐 **Uses port 443** - The standard HTTPS port (rarely blocked)
- 👀 **Harder to detect** - Looks like normal HTTPS traffic
- ⚡ **Fast and reliable** - Nginx is battle-tested
- 🛡️ **SSH encryption** - Same security as Layer 3
- 📱 **Works with all SSH clients** - Compatible everywhere

### ⚠️ Limitations
- ⚙️ **Slightly more setup** - Needs Nginx installed
- 🚫 **Disables Apache/Plesk** - Can't run web servers on port 443
- 🔍 **DPI might still detect** - Advanced inspection can identify SSH

---

## 🎯 Best For

- 🌍 **Most users** - Best all-around choice
- 🏢 **Corporate networks** - Port 443 usually open
- ✈️ **Travel** - Port 443 works almost everywhere
- 🔒 **Light censorship** - Bypasses basic blocking
- 💼 **Daily use** - Reliable and performant

**⭐ This is our #1 recommendation!**

---

## 🚀 Installation (Easy!)

### Step 1: Connect to Your VPS

On **Windows** (PowerShell/CMD):
```cmd
ssh root@YOUR_SERVER_IP
```

On **Mac/Linux** (Terminal):
```bash
ssh root@YOUR_SERVER_IP
```

### Step 2: Run Installation

Copy and paste this command:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer4-nginx/install.sh -o install.sh && bash install.sh
```

Or if you cloned the repository:

```bash
cd ssh-socks-proxy/layer4-nginx
bash install.sh
```

### Step 3: Confirm Installation

The installer will:
1. ✅ Check your system
2. ⚠️ **Warn about disabling Apache/Plesk** (if running)
3. 📦 Install Nginx and dependencies
4. ⚙️ Configure SSH and Nginx
5. 🔥 Configure firewall
6. ✅ Show connection details

**⚠️ IMPORTANT:** If you're using your VPS for a website on port 443, this will disable it!

**Total time: 5-7 minutes**

---

## 👤 Adding Users

After installation, create users to connect:

### Interactive Mode (Recommended)
```bash
cd ../common
bash add-user.sh
```

Follow prompts for username and password.

### Quick Mode
```bash
cd ../common
bash add-user.sh myusername mypassword
```

---

## 📱 Connecting from Your Devices

### iPhone/iPad (NPV Tunnel)

1. **Download:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **Tap "+" to add connection**
3. **Select "SSH"** (not SSH+SSL)
4. **Enter details:**
   - **Name:** My Proxy
   - **Server:** Your VPS IP
   - **Port:** `443` ⬅️ **Important: use 443, not 22**
   - **Username:** From add-user
   - **Password:** From add-user
5. **Save and connect** ✅

### Android (Net Mod)

1. **Download:** [Net Mod](https://play.google.com/store/apps/details?id=com.netmod.app)
2. **SSH Tunnel** mode
3. **Enter details:**
   - **Server:** Your VPS IP
   - **Port:** `443` ⬅️ **Use 443**
   - **Username:** From add-user
   - **Password:** From add-user
4. **Connect** ✅

### Windows (PuTTY)

1. **Download:** [PuTTY](https://www.putty.org/)
2. **Configuration:**
   - **Host:** Your VPS IP
   - **Port:** `443` ⬅️ **Use 443, not 22**
   - **Connection type:** SSH
3. **Tunnels:**
   - Go to: Connection → SSH → Tunnels
   - **Source port:** `1080`
   - **Type:** Dynamic
   - Click "Add"
4. **Save profile** and **Open**
5. **Login** and keep window open

### macOS/Linux (Terminal)

```bash
ssh -p 443 -D 1080 -N username@YOUR_SERVER_IP
```

**Note:** The `-p 443` tells SSH to use port 443!

Keep terminal window open while using proxy.

---

## 🌐 Configuring Your Browser/Apps

After connecting, point your browser to the local SOCKS proxy:

### Firefox (Recommended)
1. **Settings** → **Network Settings**
2. **Manual proxy configuration**
3. **SOCKS Host:** `127.0.0.1`
4. **Port:** `1080`
5. **SOCKS v5:** ✓
6. **Proxy DNS:** ✓

### Chrome/Edge
1. **Settings** → **System** → **Proxy settings**
2. **SOCKS proxy:** `127.0.0.1:1080`

### System-Wide Proxy
- **Windows:** Settings → Network → Proxy → Manual: `127.0.0.1:1080`
- **macOS:** System Preferences → Network → Advanced → Proxies → SOCKS: `127.0.0.1:1080`

---

## 🛠️ Management Commands

Navigate to the common folder:

```bash
cd /path/to/ssh-socks-proxy/common
```

### Add User
```bash
bash add-user.sh
```

### Delete User
```bash
bash delete-user.sh username
```

### List Users
```bash
bash list-users.sh
```

### Check Status
```bash
bash status.sh
```

Should show:
- ✅ SSH running on port 22
- ✅ Nginx running and forwarding 443→22

### Backup
```bash
bash backup-config.sh
```

### Uninstall
```bash
bash uninstall.sh
```

---

## 🔧 Troubleshooting

### Can't Connect?

**1. Check services are running:**
```bash
bash status.sh
```

Both SSH and Nginx should show "✓ Running"

**2. Check firewall:**
```bash
ufw status
```

Should show:
```
443/tcp    ALLOW
22/tcp     ALLOW
```

**3. Test port 443:**
```bash
ss -tulpn | grep :443
```

Should show Nginx listening on port 443.

### "Connection refused" on port 443?

**Restart Nginx:**
```bash
systemctl restart nginx
systemctl status nginx
```

**Check Nginx config:**
```bash
nginx -t
```

Should say "configuration test successful"

### Services not starting?

**View Nginx logs:**
```bash
journalctl -xe -u nginx
```

**View SSH logs:**
```bash
journalctl -xe -u ssh
```

**Check installation log:**
```bash
tail -50 /var/log/ssh-proxy.log
```

### Port 443 already in use?

Something else is using port 443. Check what:
```bash
ss -tulpn | grep :443
```

The installation should have disabled Apache/Plesk. If not:
```bash
systemctl stop apache2
systemctl disable apache2
systemctl mask apache2
systemctl restart nginx
```

---

## ⚡ Performance Tips

### Speed Optimization

1. **Choose VPS location wisely**
   - Pick a location geographically close to you
   - Or close to services you want to access

2. **Check VPS bandwidth**
   - Most VPS have 1-5 TB/month
   - Monitor usage: `vnstat` (install with `apt install vnstat`)

3. **Optimize SSH**
   - Already optimized by our script
   - Uses fast ciphers automatically

### Connection Stability

**For mobile (sleep/wake issues):**
- Enable "Keep alive" in your SSH client
- NPV Tunnel: Enable "Auto reconnect"

**For desktop:**
Add to your SSH command:
```bash
ssh -p 443 -D 1080 -N -o ServerAliveInterval=60 username@YOUR_SERVER_IP
```

---

## 🔄 Switching from Other Layers

If you installed Layer 3 (basic):

1. **Uninstall Layer 3:**
   ```bash
   cd ssh-socks-proxy/common
   bash uninstall.sh
   ```

2. **Install Layer 4:**
   ```bash
   cd ../layer4-nginx
   bash install.sh
   ```

3. **Recreate users:**
   ```bash
   cd ../common
   bash add-user.sh
   ```

---

## 📊 Technical Details

- **Protocol:** SSH over TCP (via Nginx stream)
- **Port:** 443 (external) → 22 (internal)
- **Proxy:** Nginx stream module
- **Encryption:** SSH (AES-128/256)
- **Authentication:** Password-based
- **Proxy Type:** SOCKS5
- **Multi-user:** Yes (unlimited)

### How It Works

```
Your Device
    ↓
Connect to port 443 (looks like HTTPS)
    ↓
Nginx on VPS (port 443)
    ↓
Forwards to SSH (port 22 locally)
    ↓
SSH creates SOCKS proxy
    ↓
Internet
```

Network observers see: "HTTPS traffic to port 443" ✅
Reality: SSH proxy tunnel 🔐

---

## ❓ FAQ

**Q: Is this better than Layer 3?**
**A:** Yes, for most people. Port 443 is rarely blocked and harder to detect.

**Q: Can I run a website too?**
**A:** Not on port 443. But you can use port 80 or other ports for websites.

**Q: Will this break my existing website?**
**A:** If your site uses port 443 (HTTPS), yes. Use Layer 3 instead or move your site to another port.

**Q: Why port 443?**
**A:** It's the standard HTTPS port. Firewalls rarely block it, and it blends in with normal web traffic.

**Q: Can I change the port?**
**A:** Yes! Edit `/etc/nginx/stream.d/ssh_443.conf` and change `listen 443` to another port, then restart Nginx.

**Q: How secure is this?**
**A:** Very secure. SSH encryption + Nginx is a proven combination. Same encryption as Layer 3.

---

## 🎓 Next Steps

### Upgrade for More Stealth

If Layer 4 is still being blocked:

- **[Layer 6 (Stunnel)](../layer6-stunnel/README.md)** - Adds TLS encryption
- **[Layer 7 (V2Ray)](../layer7-v2ray-vmess/README.md)** - Maximum stealth

### Learn More

- **[Main guide](../README.md)** - Compare all methods
- **[Management tools](../README.md#management-commands)** - User and system management

---

[← Back to main guide](../README.md) | [Next: Layer 6 Guide →](../layer6-stunnel/README.md)

**Made with ❤️ for internet freedom**
