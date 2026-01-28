# 📙 لایه 6: پوشش TLS با Stunnel

> **رمزنگاری دوگانه** • امنیت بالا • پورت 443 • برای فایروال‌های سخت‌گیر

[← بازگشت به راهنمای اصلی](../README.md)

---

## 📖 لایه 6 چیست؟

لایه 6 ترافیک SSH را درون TLS (همان رمزنگاری که توسط وب‌سایت‌های HTTPS استفاده می‌شود) می‌پیچد. این کار **رمزنگاری دوگانه** ایجاد می‌کند: TLS + SSH، که امنیت بسیار بالایی دارد و تشخیص آن نسبت به SSH معمولی بسیار سخت‌تر است.

### ✅ مزایا
- 🔐🔐 **رمزنگاری دوگانه** - پوشش TLS دور SSH
- 🕵️ **تشخیص بسیار سخت** - دقیقاً شبیه ترافیک HTTPS به نظر می‌رسد
- 🌍 **دور زدن فایروال‌های سخت‌گیر** - پورت 443 با دست‌دادن TLS
- 🛡️ **لایه امنیتی اضافی** - دو لایه رمزنگاری مستقل
- 📱 **کار با کلاینت‌های SSH+SSL** - به‌ویژه NPV Tunnel

### ⚠️ محدودیت‌ها
- ⚙️ **راه‌اندازی پیچیده‌تر** - نیازمند پیکربندی stunnel
- 🚫 **غیرفعال کردن Apache/Plesk** - نمی‌توان وب‌سرور روی پورت 443 اجرا کرد
- 📱 **سازگاری کلاینت** - برخی کلاینت‌ها به پشتیبانی stunnel نیاز دارند
- 🔧 **کمی سربار بیشتر** - دو لایه رمزنگاری (تاثیر ناچیز)

---

## 🎯 بهترین برای

- 🔒 **نیازهای امنیتی بالا** - می‌خواهید حداکثر رمزنگاری را داشته باشید
- 🌍 **سانسور سخت‌گیرانه** - زمانی که SSH به‌طور فعال مسدود می‌شود
- 🏢 **فایروال‌های سازمانی** - دور زدن بازرسی عمیق بسته‌ها
- 🔐 **کاربران محتاط** - می‌خواهند امنیت چند لایه داشته باشند
- ✈️ **کشورهای دارای سانسور** - ایران، چین، امارات و غیره

**برای مبتدیان توصیه نمی‌شود** - ابتدا [لایه 4](../layer4-nginx/README.md) را امتحان کنید

---

## 🚀 نصب و راه‌اندازی

### مرحله 1: اتصال به سرور

```bash
ssh root@YOUR_SERVER_IP
```

### مرحله 2: اجرای نصب

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer6-stunnel/install.sh -o install.sh && bash install.sh
```

یا از مخزن کلون شده:

```bash
cd ssh-socks-proxy/layer6-stunnel
bash install.sh
```

### مرحله 3: تایید نصب

نصب‌کننده این کارها را انجام می‌دهد:
1. ✅ بررسی سیستم
2. ⚠️ **غیرفعال کردن Apache/Plesk/Nginx**
3. 📦 نصب SSH، stunnel، OpenSSL
4. 🔐 تولید گواهی TLS
5. ⚙️ پیکربندی stunnel و SSH
6. 🔥 راه‌اندازی فایروال
7. ✅ نمایش جزئیات اتصال

**⚠️ هشدار:** این کار تمام وب‌سرورها را روی پورت 443 متوقف می‌کند!

**مدت زمان کل: 7-10 دقیقه**

---

## 👤 اضافه کردن کاربر

```bash
cd ../common
bash add-user.sh
```

مشابه روش‌های دیگر مبتنی بر SSH.

---

## 📱 اتصال از دستگاه‌های شما

### آیفون/آی‌پد (NPV Tunnel) ⭐ بهترین گزینه

1. **دانلود:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **روی "+" بزنید تا اتصال اضافه کنید**
3. **"SSH + SSL" را انتخاب کنید** ⬅️ **مهم: SSH+SSL را انتخاب کنید، نه فقط SSH!**
4. **جزئیات را وارد کنید:**
   - **نام:** پروکسی Stunnel من
   - **سرور:** IP سرور شما
   - **پورت:** `443`
   - **نام کاربری:** از add-user
   - **رمز عبور:** از add-user
   - **SSL:** روشن (فعال)
5. **ذخیره کرده و متصل شوید** ✅

NPV Tunnel به‌طور خودکار پوشش TLS را مدیریت می‌کند!

### اندروید (راه‌اندازی دستی)

اندروید به دو مرحله نیاز دارد: کلاینت stunnel + کلاینت SSH.

**گزینه الف: به‌جای آن از V2Ray/Xray استفاده کنید**
[لایه 7 (V2Ray)](../layer7-v2ray-vmess/README.md) را برای راه‌اندازی آسان‌تر اندروید در نظر بگیرید.

**گزینه ب: stunnel + SSH دستی:**
1. نصب [SSLDroid](https://play.google.com/store/apps/details?id=hu.sztupy.ssldroid) (تونل TLS)
2. پیکربندی SSLDroid برای اتصال به VPS:443
3. فوروارد به localhost:22
4. استفاده از کلاینت SSH برای اتصال به localhost:2222

*(این کار پیچیده است - لایه 7 برای اندروید آسان‌تر است!)*

### ویندوز (stunnel + PuTTY)

**مرحله 1: نصب stunnel**
1. دانلود: [stunnel برای ویندوز](https://www.stunnel.org/downloads.html)
2. نصب stunnel

**مرحله 2: پیکربندی stunnel**
1. باز کردن `stunnel.conf` (در پوشه نصب stunnel)
2. اضافه کردن:
```ini
[ssh]
client = yes
accept = 127.0.0.1:2222
connect = YOUR_SERVER_IP:443
```
3. ذخیره و راه‌اندازی مجدد stunnel

**مرحله 3: اتصال با PuTTY**
1. باز کردن PuTTY
2. میزبان: `127.0.0.1` (نه IP سرور!)
3. پورت: `2222`
4. Connection → SSH → Tunnels:
   - Source port: `1080`
   - Type: Dynamic
   - Add
5. باز کردن اتصال

### macOS/Linux (stunnel + SSH)

**مرحله 1: نصب stunnel**

macOS:
```bash
brew install stunnel
```

Linux:
```bash
sudo apt install stunnel4
```

**مرحله 2: ایجاد فایل پیکربندی stunnel**

ایجاد فایل `~/stunnel-ssh.conf`:
```ini
[ssh]
client = yes
accept = 127.0.0.1:2222
connect = YOUR_SERVER_IP:443
```

**مرحله 3: راه‌اندازی stunnel**
```bash
stunnel ~/stunnel-ssh.conf
```

**مرحله 4: اتصال از طریق SSH**
```bash
ssh -p 2222 -D 1080 -N username@127.0.0.1
```

---

## 🌐 پیکربندی مرورگر

مشابه روش‌های دیگر:

**فایرفاکس:**
- SOCKS Host: `127.0.0.1`
- Port: `1080`
- SOCKS v5: ✓

**کروم/سیستم:**
- SOCKS proxy: `127.0.0.1:1080`

---

## 🛠️ دستورات مدیریتی

```bash
cd /path/to/ssh-socks-proxy/common

# مدیریت کاربران
bash add-user.sh
bash delete-user.sh username
bash list-users.sh

# مدیریت سیستم
bash status.sh
bash backup-config.sh
bash uninstall.sh
```

---

## 🔧 عیب‌یابی

### نمی‌توانید وصل شوید؟

**بررسی اجرای stunnel:**
```bash
service stunnel4 status
```

باید نمایش دهد "active (running)"

**بررسی لاگ‌های stunnel:**
```bash
tail -f /var/log/stunnel.log
```

**راه‌اندازی مجدد stunnel:**
```bash
service stunnel4 restart
```

### stunnel راه‌اندازی نمی‌شود؟

**بررسی پیکربندی:**
```bash
cat /etc/stunnel/stunnel.conf
```

باید شبیه این باشد:
```ini
pid = /var/run/stunnel.pid
output = /var/log/stunnel.log
foreground = no
client = no

[ssh-tls]
accept = 443
connect = 127.0.0.1:22
cert = /etc/stunnel/stunnel.pem
```

**بررسی وجود گواهی:**
```bash
ls -l /etc/stunnel/stunnel.pem
```

**تست دستی:**
```bash
stunnel /etc/stunnel/stunnel.conf
```

### مشکلات پورت 443؟

**بررسی چه چیزی روی پورت 443 است:**
```bash
ss -tulpn | grep :443
```

باید فقط stunnel را نشان دهد.

**متوقف کردن سرویس‌های در تعارض:**
```bash
systemctl stop nginx apache2
systemctl mask nginx apache2
service stunnel4 restart
```

### خطاهای گواهی SSL؟

در سمت کلاینت: "Allow insecure" یا "Skip verification" را فعال کنید

گواهی خود-امضا شده است، که برای این مورد استفاده طبیعی و امن است.

---

## ⚡ عملکرد و امنیت

### عملکرد
- **سربار:** ناچیز (کاهش 1-3 درصدی در سرعت انتقال)
- **تاخیر:** +1-2 میلی‌ثانیه از رمزنگاری دوگانه
- **CPU:** کمی بالاتر (معمولاً قابل توجه نیست)

### مزایای امنیتی

1. **رمزنگاری TLS 1.3** (لایه بیرونی)
2. **رمزنگاری SSH** (لایه درونی)
3. **شبیه HTTPS به نظر می‌رسد** - پورت 443، دست‌دادن TLS
4. **مقاوم در برابر DPI** - نمی‌تواند SSH را داخل TLS ببیند
5. **قابلیت پین کردن گواهی** - امنیت اضافی سمت کلاینت

---

## 📊 جزئیات فنی

- **پروتکل:** SSH پیچیده شده در TLS (stunnel)
- **پورت:** 443 (TLS خارجی) → 22 (SSH داخلی)
- **نسخه TLS:** TLS 1.2/1.3 (به‌طور خودکار مذاکره می‌شود)
- **گواهی:** خود-امضا شده (10 سال اعتبار)
- **رمزنگاری:** TLS + SSH (لایه دوگانه)
- **نوع پروکسی:** SOCKS5 (از طریق SSH)

### چگونه کار می‌کند

```
دستگاه شما
    ↓ کلاینت stunnel
اتصال رمزنگاری شده TLS به پورت 443
    ↓
سرور stunnel روی VPS (پورت 443)
    ↓ رمزگشایی TLS
SSH روی localhost:22
    ↓ رمزنگاری SSH
پروکسی SOCKS
    ↓
اینترنت
```

دو لایه رمزنگاری مستقل از ترافیک شما محافظت می‌کنند!

---

## 🔄 تغییر روش‌ها

**از لایه 4 به لایه 6:**
```bash
cd ssh-socks-proxy/common
bash uninstall.sh
cd ../layer6-stunnel
bash install.sh
cd ../common
bash add-user.sh
```

**از لایه 6 به لایه 7:**
لایه 7 برای اندروید آسان‌تر است و پنهان‌کاری مشابهی بدون پیچیدگی stunnel ارائه می‌دهد.

---

## ❓ سوالات متداول

**س: آیا رمزنگاری دوگانه ضروری است؟**
**ج:** برای اکثر کاربران خیر. اما حداکثر امنیت و دور زدن بهتر DPI را فراهم می‌کند.

**س: چرا فقط از SSH معمولی استفاده نکنیم؟**
**ج:** پوشش TLS باعث می‌شود دقیقاً شبیه HTTPS به نظر برسد، که مسدود کردن آن سخت‌تر است.

**س: آیا مدیران شبکه می‌توانند این را تشخیص دهند؟**
**ج:** بسیار سخت است. آن‌ها می‌بینند: "اتصال TLS به پورت 443" - شبیه HTTPS عادی به نظر می‌رسد.

**س: آیا این کندتر از لایه 4 است؟**
**ج:** کمی، اما متوجه نخواهید شد مگر اینکه اتصال بسیار کندی داشته باشید.

**س: کدام بهتر است: لایه 6 یا لایه 7؟**
**ج:** لایه 7 (V2Ray) استفاده آسان‌تری دارد و پنهان‌کاری مشابهی ارائه می‌دهد. لایه 6 اگر رمزنگاری دوگانه می‌خواهید به شما می‌دهد.

**س: آیا می‌توانم به راحتی از لایه 6 روی اندروید استفاده کنم؟**
**ج:** نه به راحتی. NPV Tunnel روی iOS عالی کار می‌کند. برای اندروید، به جای آن از لایه 7 استفاده کنید.

**س: آیا گواهی خود-امضا شده امن است؟**
**ج:** بله! شما به یک وب‌سایت عمومی دسترسی پیدا نمی‌کنید، بنابراین به CA معتبر نیاز ندارید. خود-امضا شده برای این مورد استفاده خوب و امن است.

---

## 🎓 مراحل بعدی

### پنهان‌کاری بیشتر؟

- **[لایه 7 (V2Ray)](../layer7-v2ray-vmess/README.md)** - پروتکل مدرن، آسان‌تر روی اندروید

### راه‌اندازی ساده‌تر؟

- **[لایه 4 (Nginx)](../layer4-nginx/README.md)** - راه‌اندازی آسان‌تر، برای اکثر موارد کافی است

### مقایسه همه روش‌ها

- **[راهنمای اصلی](../README.md)** - مشاهده همه گزینه‌ها

---

[← بازگشت به راهنمای اصلی](../README.md) | [بعدی: راهنمای لایه 7 →](../layer7-v2ray-vmess/README.md)

**با ❤️ برای آزادی اینترنت ساخته شده**

---

# 📙 Layer 6: Stunnel TLS Wrapper

> **Double encryption** • High security • Port 443 • For strict firewalls

[← Back to main guide](../README.md)

---

## 📖 What is Layer 6?

Layer 6 wraps SSH traffic in TLS (the same encryption used by HTTPS websites). This provides **double encryption**: TLS + SSH, making it extremely secure and harder to detect than regular SSH.

### ✅ Advantages
- 🔐🔐 **Double encryption** - TLS wrapper around SSH
- 🕵️ **Very hard to detect** - Looks exactly like HTTPS traffic
- 🌍 **Bypasses strict firewalls** - Port 443 with TLS handshake
- 🛡️ **Extra security layer** - Two independent encryption layers
- 📱 **Works with SSH+SSL clients** - Especially NPV Tunnel

### ⚠️ Limitations
- ⚙️ **More complex setup** - Requires stunnel configuration
- 🚫 **Disables Apache/Plesk** - Can't run web servers on port 443
- 📱 **Client compatibility** - Some clients need stunnel support
- 🔧 **Slightly more overhead** - Two encryption layers (minimal impact)

---

## 🎯 Best For

- 🔒 **High security needs** - Want maximum encryption
- 🌍 **Strict censorship** - When SSH is actively blocked
- 🏢 **Corporate firewalls** - Deep packet inspection bypass
- 🔐 **Paranoid users** - Want belt and suspenders security
- ✈️ **Countries with censorship** - Iran, China, UAE, etc.

**Not recommended for beginners** - Try [Layer 4](../layer4-nginx/README.md) first

---

## 🚀 Installation

### Step 1: Connect to VPS

```bash
ssh root@YOUR_SERVER_IP
```

### Step 2: Run Installation

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer6-stunnel/install.sh -o install.sh && bash install.sh
```

Or from cloned repo:

```bash
cd ssh-socks-proxy/layer6-stunnel
bash install.sh
```

### Step 3: Confirm Installation

The installer will:
1. ✅ Check system
2. ⚠️ **Disable Apache/Plesk/Nginx**
3. 📦 Install SSH, stunnel, OpenSSL
4. 🔐 Generate TLS certificate
5. ⚙️ Configure stunnel and SSH
6. 🔥 Set up firewall
7. ✅ Show connection details

**⚠️ WARNING:** This will stop all web servers on port 443!

**Total time: 7-10 minutes**

---

## 👤 Adding Users

```bash
cd ../common
bash add-user.sh
```

Same as other SSH-based methods.

---

## 📱 Connecting from Your Devices

### iPhone/iPad (NPV Tunnel) ⭐ BEST OPTION

1. **Download:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **Tap "+" to add connection**
3. **Select "SSH + SSL"** ⬅️ **Important: Choose SSH+SSL, not just SSH!**
4. **Enter details:**
   - **Name:** My Stunnel Proxy
   - **Server:** Your VPS IP
   - **Port:** `443`
   - **Username:** From add-user
   - **Password:** From add-user
   - **SSL:** ON (enabled)
5. **Save and connect** ✅

NPV Tunnel handles the TLS wrapper automatically!

### Android (Manual Setup)

Android requires two steps: stunnel client + SSH client.

**Option A: Use V2Ray/Xray instead**
Consider [Layer 7 (V2Ray)](../layer7-v2ray-vmess/README.md) for easier Android setup.

**Option B: Manual stunnel + SSH:**
1. Install [SSLDroid](https://play.google.com/store/apps/details?id=hu.sztupy.ssldroid) (TLS tunnel)
2. Configure SSLDroid to connect to your VPS:443
3. Forward to localhost:22
4. Use SSH client to connect to localhost:2222

*(This is complex - Layer 7 is easier for Android!)*

### Windows (stunnel + PuTTY)

**Step 1: Install stunnel**
1. Download: [stunnel for Windows](https://www.stunnel.org/downloads.html)
2. Install stunnel

**Step 2: Configure stunnel**
1. Open `stunnel.conf` (in stunnel installation folder)
2. Add:
```ini
[ssh]
client = yes
accept = 127.0.0.1:2222
connect = YOUR_SERVER_IP:443
```
3. Save and restart stunnel

**Step 3: Connect with PuTTY**
1. Open PuTTY
2. Host: `127.0.0.1` (not your server IP!)
3. Port: `2222`
4. Connection → SSH → Tunnels:
   - Source port: `1080`
   - Type: Dynamic
   - Add
5. Open connection

### macOS/Linux (stunnel + SSH)

**Step 1: Install stunnel**

macOS:
```bash
brew install stunnel
```

Linux:
```bash
sudo apt install stunnel4
```

**Step 2: Create stunnel config**

Create file `~/stunnel-ssh.conf`:
```ini
[ssh]
client = yes
accept = 127.0.0.1:2222
connect = YOUR_SERVER_IP:443
```

**Step 3: Start stunnel**
```bash
stunnel ~/stunnel-ssh.conf
```

**Step 4: Connect via SSH**
```bash
ssh -p 2222 -D 1080 -N username@127.0.0.1
```

---

## 🌐 Browser Configuration

Same as other methods:

**Firefox:**
- SOCKS Host: `127.0.0.1`
- Port: `1080`
- SOCKS v5: ✓

**Chrome/System:**
- SOCKS proxy: `127.0.0.1:1080`

---

## 🛠️ Management Commands

```bash
cd /path/to/ssh-socks-proxy/common

# Manage users
bash add-user.sh
bash delete-user.sh username
bash list-users.sh

# System management
bash status.sh
bash backup-config.sh
bash uninstall.sh
```

---

## 🔧 Troubleshooting

### Can't Connect?

**Check stunnel is running:**
```bash
service stunnel4 status
```

Should say "active (running)"

**Check stunnel logs:**
```bash
tail -f /var/log/stunnel.log
```

**Restart stunnel:**
```bash
service stunnel4 restart
```

### stunnel not starting?

**Check configuration:**
```bash
cat /etc/stunnel/stunnel.conf
```

Should look like:
```ini
pid = /var/run/stunnel.pid
output = /var/log/stunnel.log
foreground = no
client = no

[ssh-tls]
accept = 443
connect = 127.0.0.1:22
cert = /etc/stunnel/stunnel.pem
```

**Check certificate exists:**
```bash
ls -l /etc/stunnel/stunnel.pem
```

**Manually test:**
```bash
stunnel /etc/stunnel/stunnel.conf
```

### Port 443 issues?

**Check what's on port 443:**
```bash
ss -tulpn | grep :443
```

Should only show stunnel.

**Kill conflicting services:**
```bash
systemctl stop nginx apache2
systemctl mask nginx apache2
service stunnel4 restart
```

### SSL Certificate Errors?

On client side: Enable "Allow insecure" or "Skip verification"

The certificate is self-signed, which is normal and secure for this use case.

---

## ⚡ Performance & Security

### Performance
- **Overhead:** Minimal (1-3% throughput reduction)
- **Latency:** +1-2ms from double encryption
- **CPU:** Slightly higher (usually not noticeable)

### Security Benefits

1. **TLS 1.3 encryption** (outer layer)
2. **SSH encryption** (inner layer)
3. **Looks like HTTPS** - Port 443, TLS handshake
4. **DPI resistant** - Can't see SSH inside TLS
5. **Certificate pinning possible** - Extra client-side security

---

## 📊 Technical Details

- **Protocol:** SSH wrapped in TLS (stunnel)
- **Port:** 443 (external TLS) → 22 (internal SSH)
- **TLS Version:** TLS 1.2/1.3 (automatically negotiated)
- **Certificate:** Self-signed (10 years validity)
- **Encryption:** TLS + SSH (double layer)
- **Proxy Type:** SOCKS5 (via SSH)

### How It Works

```
Your Device
    ↓ stunnel client
TLS encrypted connection to port 443
    ↓
stunnel server on VPS (port 443)
    ↓ decrypts TLS
SSH on localhost:22
    ↓ SSH encryption
SOCKS proxy
    ↓
Internet
```

Two independent encryption layers protect your traffic!

---

## 🔄 Switching Methods

**From Layer 4 to Layer 6:**
```bash
cd ssh-socks-proxy/common
bash uninstall.sh
cd ../layer6-stunnel
bash install.sh
cd ../common
bash add-user.sh
```

**From Layer 6 to Layer 7:**
Layer 7 is easier for Android and provides similar stealth without stunnel complexity.

---

## ❓ FAQ

**Q: Is double encryption necessary?**
**A:** Not for most users. But it provides maximum security and better DPI bypass.

**Q: Why not just use regular SSH?**
**A:** TLS wrapper makes it look exactly like HTTPS, which is harder to block.

**Q: Can network admins detect this?**
**A:** Very difficult. They see: "TLS connection to port 443" - looks like normal HTTPS.

**Q: Is this slower than Layer 4?**
**A:** Slightly, but you won't notice unless you're on a very slow connection.

**Q: Which is better: Layer 6 or Layer 7?**
**A:** Layer 7 (V2Ray) is easier to use and provides similar stealth. Layer 6 gives you double encryption if you want that.

**Q: Can I use Layer 6 on Android easily?**
**A:** Not easily. NPV Tunnel works great on iOS. For Android, use Layer 7 instead.

**Q: Is the self-signed certificate secure?**
**A:** Yes! You're not accessing a public website, so you don't need a trusted CA. Self-signed is fine and secure for this use case.

---

## 🎓 Next Steps

### Even More Stealth?

- **[Layer 7 (V2Ray)](../layer7-v2ray-vmess/README.md)** - Modern protocol, easier on Android

### Simpler Setup?

- **[Layer 4 (Nginx)](../layer4-nginx/README.md)** - Easier setup, good enough for most

### Compare All Methods

- **[Main guide](../README.md)** - See all options

---

[← Back to main guide](../README.md) | [Next: Layer 7 Guide →](../layer7-v2ray-vmess/README.md)

**Made with ❤️ for internet freedom**
