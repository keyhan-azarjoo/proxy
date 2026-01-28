# 📘 لایه ۳: پروکسی SOCKS پایه SSH

> **ساده‌ترین راه برای شروع** • مناسب مبتدی‌ها • رمزنگاری استاندارد SSH

[← بازگشت به راهنمای اصلی](../README.md)

---

## 📖 لایه ۳ چیست؟

لایه ۳ از پروتکل استاندارد SSH روی پورت ۲۲ استفاده می‌کند. این ساده‌ترین روش راه‌اندازی است - فقط SSH که به گونه‌ای تنظیم شده که اتصالات پروکسی SOCKS را مجاز کند.

### ✅ مزایا
- ⭐ **راه‌اندازی بسیار آسان** - ۳ تا ۵ دقیقه
- 🔧 **تنظیمات کمینه** - فقط سرور SSH
- 🛡️ **امنیت اثبات‌شده** - SSH یک پروتکل امن و آزموده‌شده است
- 📱 **سازگار با تمام کلاینت‌های SSH** - در همه جا کار می‌کند
- 💻 **نیاز به نرم‌افزار اضافی ندارد** - از SSH داخلی استفاده می‌کند

### ⚠️ محدودیت‌ها
- 🚫 **پورت ۲۲ ممکن است مسدود شود** - برخی شبکه‌ها/کشورها SSH را مسدود می‌کنند
- 👁️ **به راحتی قابل شناسایی است** - مدیران شبکه می‌توانند ترافیک SSH را ببینند
- 🔒 **برای سانسور شدید مناسب نیست** - DPI می‌تواند SSH را تشخیص دهد

---

## 🎯 مناسب برای

- 🔰 **کاربران تازه‌کار** که می‌خواهند یاد بگیرند
- 🧪 **تست و یادگیری** قبل از امتحان روش‌های پیشرفته‌تر
- 🏠 **استفاده خانگی/اداری** در جاهایی که SSH مسدود نیست
- 🎓 **درک مفاهیم پایه** پروکسی‌های SOCKS

---

## 🚀 نصب (خیلی آسان!)

### مرحله ۱: اتصال به سرور شما

در **Windows** از PowerShell یا Command Prompt استفاده کنید:
```cmd
ssh root@YOUR_SERVER_IP
```

در **Mac/Linux** از Terminal استفاده کنید:
```bash
ssh root@YOUR_SERVER_IP
```

*به جای `YOUR_SERVER_IP` آدرس IP سرور خود را بگذارید*

### مرحله ۲: دانلود و اجرای نصب

این یک دستور را کپی و اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer3-basic/install.sh -o install.sh && bash install.sh
```

یا اگر مخزن را clone کرده‌اید:

```bash
cd ssh-socks-proxy/layer3-basic
bash install.sh
```

### مرحله ۳: پیروی از دستورات روی صفحه

نصب‌کننده این کارها را انجام می‌دهد:
1. ✅ بررسی سیستم شما (Ubuntu، فضای دیسک و غیره)
2. 📦 نصب سرور SSH و فایروال
3. ⚙️ تنظیم SSH برای پروکسی SOCKS
4. 🔥 تنظیم فایروال
5. ✅ نمایش جزئیات اتصال

**زمان کل: ۳-۵ دقیقه**

---

## 👤 اضافه کردن کاربران

بعد از نصب، یک کاربر برای اتصال بسازید:

### روش ۱: حالت تعاملی (پیشنهادی)
```bash
cd ../common
bash add-user.sh
```

از شما پرسیده می‌شود:
- نام کاربری (فقط حروف، اعداد، خط تیره و زیرخط)
- رمز عبور (هنگام تایپ مخفی می‌ماند)
- تأیید رمز عبور

### روش ۲: حالت سریع
```bash
cd ../common
bash add-user.sh myusername mypassword
```

⚠️ **هشدار:** این روش رمز عبور را در تاریخچه دستورات نمایش می‌دهد (کمتر امن)

---

## 📱 اتصال از دستگاه‌های شما

### iPhone/iPad (NPV Tunnel)

1. **دانلود اپلیکیشن:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **باز کنید** و روی "+" بزنید
3. **"SSH" را انتخاب کنید** (نه SSH+SSL)
4. **مشخصات را وارد کنید:**
   - **Name:** پروکسی من (یا هر نامی)
   - **Server:** آدرس IP سرور شما
   - **Port:** `22`
   - **Username:** از مرحله add-user
   - **Password:** از مرحله add-user
5. **ذخیره و اتصال** ✅

### Android (Net Mod)

1. **دانلود اپلیکیشن:** [Net Mod](https://play.google.com/store/apps/details?id=com.netmod.app)
2. **باز کنید** → SSH Tunnel
3. **مشخصات را وارد کنید:**
   - **Server:** IP سرور شما
   - **Port:** `22`
   - **Username:** از مرحله add-user
   - **Password:** از مرحله add-user
4. **روی "Connect" بزنید** ✅

### Windows (PuTTY)

1. **دانلود:** [PuTTY](https://www.putty.org/)
2. **اجرای PuTTY**
3. **تنظیمات:**
   - **Host Name:** IP سرور شما
   - **Port:** `22`
   - **Connection type:** SSH
4. **بروید به:** Connection → SSH → Tunnels
5. **اضافه کردن تونل:**
   - **Source port:** `1080`
   - **Destination:** (خالی بگذارید)
   - **Type:** "Dynamic" را انتخاب کنید
   - روی "Add" کلیک کنید
6. **برگردید به Session**، پروفایل را ذخیره کنید، سپس "Open"
7. **وارد شوید** با نام کاربری/رمز عبور
8. **پنجره را باز نگه دارید** در حین استفاده از پروکسی

### macOS/Linux (Terminal)

Terminal را باز کنید و اجرا کنید:

```bash
ssh -D 1080 -N username@YOUR_SERVER_IP
```

جایگزین کنید:
- `username` = نام کاربری پروکسی شما
- `YOUR_SERVER_IP` = آدرس IP سرور شما

**پنجره ترمینال را باز نگه دارید** در حین استفاده از پروکسی.

---

## 🌐 تنظیم مرورگر/برنامه‌های شما

بعد از اتصال، برنامه‌ها را برای استفاده از پروکسی تنظیم کنید:

### Firefox
1. **Settings** → **Network Settings**
2. **Manual proxy configuration**
3. **SOCKS Host:** `127.0.0.1`
4. **Port:** `1080`
5. **SOCKS v5:** ✓ (علامت بزنید)
6. **Proxy DNS:** ✓ (علامت بزنید)

### Chrome/Edge
1. **Settings** → **System** → **Open proxy settings**
2. **SOCKS Proxy:** `127.0.0.1:1080`

### سیستم‌عامل (Windows)
1. **Settings** → **Network & Internet** → **Proxy**
2. **Use a proxy server:** ON
3. **Address:** `127.0.0.1`
4. **Port:** `1080`

### سیستم‌عامل (macOS)
1. **System Preferences** → **Network**
2. **Advanced** → **Proxies**
3. **SOCKS Proxy:** `127.0.0.1:1080`

---

## 🛠️ دستورات مدیریت

برای مدیریت به پوشه common بروید:

```bash
cd /path/to/ssh-socks-proxy/common
```

### لیست تمام کاربران
```bash
bash list-users.sh
```

### حذف یک کاربر
```bash
bash delete-user.sh username
```

### بررسی وضعیت سیستم
```bash
bash status.sh
```

### پشتیبان‌گیری از تنظیمات
```bash
bash backup-config.sh
```

### حذف کامل
```bash
bash uninstall.sh
```

---

## 🔧 رفع مشکلات

### نمی‌توانید وصل شوید؟

**بررسی اجرای SSH:**
```bash
systemctl status ssh
```

باید "active (running)" را به رنگ سبز نشان دهد.

**بررسی فایروال:**
```bash
ufw status
```

باید نشان دهد: `22/tcp ALLOW`

**بررسی IP شما:**
```bash
curl ifconfig.me
```

مطمئن شوید این با IP‌ای که سعی می‌کنید به آن متصل شوید مطابقت دارد.

### پیغام "Connection refused"؟

1. فایروال ممکن است مسدود کند. اجرا کنید:
   ```bash
   ufw allow 22/tcp
   ufw reload
   ```

2. SSH ممکن است در حال اجرا نباشد. اجرا کنید:
   ```bash
   systemctl restart ssh
   ```

### پیغام "Authentication failed"؟

- نام کاربری و رمز عبور را دوباره بررسی کنید
- مطمئن شوید کاربر را با `add-user.sh` ساخته‌اید
- وجود کاربر را بررسی کنید: `bash list-users.sh`

### هنوز مشکل دارید؟

**مشاهده لاگ‌های SSH:**
```bash
journalctl -xe -u ssh
```

**بررسی لاگ نصب:**
```bash
cat /var/log/ssh-proxy.log
```

---

## ⚡ مراحل بعدی

### ارتقا به روش‌های مخفی‌تر

اگر SSH مسدود می‌شود، ارتقا را در نظر بگیرید:

- **[لایه ۴ (Nginx)](../layer4-nginx/README.md)** - از پورت ۴۴۳ استفاده می‌کند، سخت‌تر مسدود می‌شود
- **[لایه ۶ (Stunnel)](../layer6-stunnel/README.md)** - رمزنگاری دوگانه
- **[لایه ۷ (V2Ray)](../layer7-v2ray-vmess/README.md)** - حداکثر مخفی‌بودن

فقط ابتدا `bash uninstall.sh` را اجرا کنید، سپس روش جدید را نصب کنید.

---

## 📊 جزئیات فنی

- **پروتکل:** SSH (OpenSSH)
- **پورت:** 22 (پورت پیش‌فرض SSH)
- **رمزنگاری:** AES-128/256-CTR/GCM (پیش‌فرض SSH)
- **احراز هویت:** مبتنی بر رمز عبور
- **نوع پروکسی:** SOCKS5
- **چند کاربره:** بله (نامحدود)

---

## ❓ سؤالات متداول

**س: چرا از این به جای VPN تجاری استفاده کنم؟**
**ج:** شما کنترل همه چیز را دارید - بدون ثبت لاگ توسط شخص ثالث، آدرس IP ثابت، حریم خصوصی کامل.

**س: می‌توانم از این برای تورنت استفاده کنم؟**
**ج:** بستگی به شرایط سرویس ارائه‌دهنده VPS شما دارد. قبل از استفاده برای P2P بررسی کنید.

**س: این آدرس IP من را مخفی می‌کند؟**
**ج:** بله، وب‌سایت‌ها IP سرور شما را به جای IP واقعی شما می‌بینند.

**س: می‌توانم چند دستگاه را متصل کنم؟**
**ج:** بله! یا کاربران جداگانه بسازید یا یک لاگین را بین دستگاه‌ها به اشتراک بگذارید.

**س: سرعت آن چقدر است؟**
**ج:** بستگی به مکان و پهنای باند VPS شما دارد. SSH سربار کمی اضافه می‌کند.

---

[← بازگشت به راهنمای اصلی](../README.md) | [بعدی: راهنمای لایه ۴ →](../layer4-nginx/README.md)

**ساخته شده با ❤️ برای آزادی اینترنت**

---

# 📘 Layer 3: Basic SSH SOCKS Proxy

> **The easiest way to get started** • Perfect for beginners • Standard SSH encryption

[← Back to main guide](../README.md)

---

## 📖 What is Layer 3?

Layer 3 uses the standard SSH protocol on port 22. It's the simplest setup - just SSH configured to allow SOCKS proxy connections.

### ✅ Advantages
- ⭐ **Easiest to set up** - 3-5 minutes
- 🔧 **Minimal configuration** - Just SSH server
- 🛡️ **Proven security** - SSH is time-tested and secure
- 📱 **Works with all SSH clients** - Compatible everywhere
- 💻 **No extra software needed** - Uses built-in SSH

### ⚠️ Limitations
- 🚫 **Port 22 can be blocked** - Some networks/countries block SSH
- 👁️ **Easy to detect** - Network admins can see SSH traffic
- 🔒 **Not suitable for strict censorship** - DPI can identify SSH

---

## 🎯 Best For

- 🔰 **First-time users** who want to learn
- 🧪 **Testing and learning** before trying advanced methods
- 🏠 **Home/office use** where SSH isn't blocked
- 🎓 **Understanding the basics** of SOCKS proxies

---

## 🚀 Installation (Super Easy!)

### Step 1: Connect to Your VPS

On **Windows**, use PowerShell or Command Prompt:
```cmd
ssh root@YOUR_SERVER_IP
```

On **Mac/Linux**, use Terminal:
```bash
ssh root@YOUR_SERVER_IP
```

*Replace `YOUR_SERVER_IP` with your VPS IP address*

### Step 2: Download and Run Installation

Copy and paste this ONE command:

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer3-basic/install.sh -o install.sh && bash install.sh
```

Or if you cloned the repository:

```bash
cd ssh-socks-proxy/layer3-basic
bash install.sh
```

### Step 3: Follow the Prompts

The installer will:
1. ✅ Check your system (Ubuntu, disk space, etc.)
2. 📦 Install SSH server and firewall
3. ⚙️ Configure SSH for SOCKS proxy
4. 🔥 Configure firewall
5. ✅ Show you the connection details

**Total time: 3-5 minutes**

---

## 👤 Adding Users

After installation, create a user to connect:

### Option 1: Interactive Mode (Recommended)
```bash
cd ../common
bash add-user.sh
```

You'll be prompted for:
- Username (letters, numbers, dash, underscore only)
- Password (will be hidden as you type)
- Password confirmation

### Option 2: Quick Mode
```bash
cd ../common
bash add-user.sh myusername mypassword
```

⚠️ **Warning:** This shows the password in command history (less secure)

---

## 📱 Connecting from Your Devices

### iPhone/iPad (NPV Tunnel)

1. **Download app:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **Open app** and tap "+"
3. **Select "SSH"** (not SSH+SSL)
4. **Enter details:**
   - **Name:** My Proxy (or any name)
   - **Server:** Your VPS IP address
   - **Port:** `22`
   - **Username:** From add-user step
   - **Password:** From add-user step
5. **Save and connect** ✅

### Android (Net Mod)

1. **Download app:** [Net Mod](https://play.google.com/store/apps/details?id=com.netmod.app)
2. **Open app** → SSH Tunnel
3. **Enter details:**
   - **Server:** Your VPS IP
   - **Port:** `22`
   - **Username:** From add-user step
   - **Password:** From add-user step
4. **Tap "Connect"** ✅

### Windows (PuTTY)

1. **Download:** [PuTTY](https://www.putty.org/)
2. **Run PuTTY**
3. **Configuration:**
   - **Host Name:** Your VPS IP
   - **Port:** `22`
   - **Connection type:** SSH
4. **Go to:** Connection → SSH → Tunnels
5. **Add tunnel:**
   - **Source port:** `1080`
   - **Destination:** (leave empty)
   - **Type:** Select "Dynamic"
   - Click "Add"
6. **Go back to Session**, save profile, then "Open"
7. **Login** with username/password
8. **Keep window open** while using proxy

### macOS/Linux (Terminal)

Open Terminal and run:

```bash
ssh -D 1080 -N username@YOUR_SERVER_IP
```

Replace:
- `username` = your proxy username
- `YOUR_SERVER_IP` = your VPS IP address

**Keep terminal window open** while using proxy.

---

## 🌐 Configuring Your Browser/Apps

After connecting, configure apps to use the proxy:

### Firefox
1. **Settings** → **Network Settings**
2. **Manual proxy configuration**
3. **SOCKS Host:** `127.0.0.1`
4. **Port:** `1080`
5. **SOCKS v5:** ✓ (check this)
6. **Proxy DNS:** ✓ (check this)

### Chrome/Edge
1. **Settings** → **System** → **Open proxy settings**
2. **SOCKS Proxy:** `127.0.0.1:1080`

### System-Wide (Windows)
1. **Settings** → **Network & Internet** → **Proxy**
2. **Use a proxy server:** ON
3. **Address:** `127.0.0.1`
4. **Port:** `1080`

### System-Wide (macOS)
1. **System Preferences** → **Network**
2. **Advanced** → **Proxies**
3. **SOCKS Proxy:** `127.0.0.1:1080`

---

## 🛠️ Management Commands

Go to the common folder for management:

```bash
cd /path/to/ssh-socks-proxy/common
```

### List All Users
```bash
bash list-users.sh
```

### Delete a User
```bash
bash delete-user.sh username
```

### Check System Status
```bash
bash status.sh
```

### Backup Configuration
```bash
bash backup-config.sh
```

### Complete Uninstall
```bash
bash uninstall.sh
```

---

## 🔧 Troubleshooting

### Can't Connect?

**Check SSH is running:**
```bash
systemctl status ssh
```

Should say "active (running)" in green.

**Check firewall:**
```bash
ufw status
```

Should show: `22/tcp ALLOW`

**Check your IP:**
```bash
curl ifconfig.me
```

Make sure this matches the IP you're trying to connect to.

### "Connection refused"?

1. Firewall might be blocking. Run:
   ```bash
   ufw allow 22/tcp
   ufw reload
   ```

2. SSH might not be running. Run:
   ```bash
   systemctl restart ssh
   ```

### "Authentication failed"?

- Double-check username and password
- Make sure you created the user with `add-user.sh`
- Check user exists: `bash list-users.sh`

### Still having issues?

**View SSH logs:**
```bash
journalctl -xe -u ssh
```

**Check installation log:**
```bash
cat /var/log/ssh-proxy.log
```

---

## ⚡ Next Steps

### Upgrade to More Stealth

If SSH is being blocked, consider upgrading:

- **[Layer 4 (Nginx)](../layer4-nginx/README.md)** - Uses port 443, harder to block
- **[Layer 6 (Stunnel)](../layer6-stunnel/README.md)** - Double encryption
- **[Layer 7 (V2Ray)](../layer7-v2ray-vmess/README.md)** - Maximum stealth

Just run `bash uninstall.sh` first, then install the new method.

---

## 📊 Technical Details

- **Protocol:** SSH (OpenSSH)
- **Port:** 22 (default SSH port)
- **Encryption:** AES-128/256-CTR/GCM (SSH default)
- **Authentication:** Password-based
- **Proxy Type:** SOCKS5
- **Multi-user:** Yes (unlimited)

---

## ❓ FAQ

**Q: Why use this instead of a commercial VPN?**
**A:** You control everything - no third-party logging, fixed IP address, full privacy.

**Q: Can I use this for torrenting?**
**A:** Depends on your VPS provider's terms of service. Check before using for P2P.

**Q: Does this hide my IP address?**
**A:** Yes, websites will see your VPS IP instead of your real IP.

**Q: Can I connect multiple devices?**
**A:** Yes! Either create separate users or share one login across devices.

**Q: How fast is it?**
**A:** Depends on your VPS location and bandwidth. SSH adds minimal overhead.

---

[← Back to main guide](../README.md) | [Next: Layer 4 Guide →](../layer4-nginx/README.md)

**Made with ❤️ for internet freedom**
