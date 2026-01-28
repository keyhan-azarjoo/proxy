# 📕 لایه ۷: پروتکل V2Ray VMess

> **بالاترین سطح پنهان‌سازی** • پروتکل مدرن • پشتیبانی از چند کاربر • بهترین گزینه برای دور زدن سانسور

[← بازگشت به راهنمای اصلی](../README.md)

---

## 📖 لایه ۷ چیست؟

لایه ۷ از پروتکل V2Ray VMess استفاده می‌کند - یک پروتکل مدرن که مخصوص عبور از سانسور طراحی شده است. این پروتکل به گونه‌ای طراحی شده که غیرقابل شناسایی باشد و شبیه ترافیک معمولی HTTPS به نظر برسد.

### ✅ مزایا
- 🥷 **بالاترین سطح پنهان‌سازی** - طراحی شده برای غیرقابل شناسایی بودن
- 🔐 **رمزنگاری مدرن** - AES-128-GCM یا ChaCha20-Poly1305
- 📱 **اپلیکیشن‌های موبایل اختصاصی** - V2RayNG، NPV Tunnel
- 👥 **مدیریت آسان چند کاربر** - افزودن کاربر بدون نیاز به راه‌اندازی مجدد
- 🌐 **مبهم‌سازی پروتکل** - شبیه ترافیک VPN به نظر نمی‌رسد
- 🚫 **مقاوم در برابر سانسور** - استفاده می‌شود در چین، ایران و غیره

### ⚠️ محدودیت‌ها
- 🔧 **پیچیده‌ترین راه‌اندازی** - نیاز به درک V2Ray دارد
- 📱 **نیاز به اپلیکیشن‌های خاص** - نمی‌توان از کلاینت‌های معمولی SSH استفاده کرد
- 🎓 **منحنی یادگیری** - فنی‌تر از روش‌های SSH
- ⚙️ **مدیریت متفاوت** - از فایل‌های پیکربندی JSON استفاده می‌کند، نه کاربران SSH

---

## 🎯 بهترین انتخاب برای

- 🌍 **سانسور پیشرفته** - چین، ایران، ترکمنستان و غیره
- 🔒 **حداکثر حریم خصوصی** - می‌خواهید از آخرین فناوری استفاده کنید
- 👥 **چند کاربر** - خانواده، تیم، سازمان
- 📱 **کاربران موبایل** - اپلیکیشن‌های موبایل عالی در دسترس است
- 🚫 **زمانی که SSH مسدود است** - حتی روی پورت 443

**برای کاربران حرفه‌ای** - اگر تازه‌کار هستید، با [لایه ۴](../layer4-nginx/README.md) شروع کنید

---

## 🚀 نصب

### مرحله ۱: اتصال به سرور مجازی (VPS)

```bash
ssh root@YOUR_SERVER_IP
```

### مرحله ۲: اجرای نصب

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer7-v2ray-vmess/install.sh -o install.sh && bash install.sh
```

یا از مخزن کلون‌شده:

```bash
cd ssh-socks-proxy/layer7-v2ray-vmess
bash install.sh
```

### مرحله ۳: ذخیره پیکربندی شما!

**⚠️ بسیار مهم:** برنامه نصب یک UUID و پیکربندی JSON نمایش می‌دهد. **حتماً ذخیره کنید!**

```
UUID: 123e4567-e89b-12d3-a456-426614174000
```

برای اتصال به این UUID نیاز دارید. همچنین در `/root/proxy-installation-info.txt` ذخیره شده است

**زمان کل: ۱۰-۱۵ دقیقه**

---

## 👤 افزودن کاربران بیشتر

برخلاف روش‌های مبتنی بر SSH، V2Ray از UUID به جای نام کاربری/رمز عبور استفاده می‌کند.

```bash
cd ssh-socks-proxy/layer7-v2ray-vmess
bash add-user.sh myusername
```

این کار:
- یک UUID جدید برای آن کاربر تولید می‌کند
- به پیکربندی Xray اضافه می‌کند
- پیکربندی JSON کلاینت را نمایش می‌دهد
- برای مراجعه بعدی در پایگاه داده ذخیره می‌کند

**هر کاربر یک UUID منحصربه‌فرد دریافت می‌کند** - آن را با آنها به اشتراک بگذارید تا متصل شوند.

---

## 📱 اتصال از دستگاه‌های شما

### iPhone/iPad (NPV Tunnel)

1. **دانلود:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **روی "+" برای افزودن اتصال کلیک کنید**
3. **"Import from Clipboard" را انتخاب کنید**
4. **این JSON را کپی کنید** (از خروجی نصب):

```json
{
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "YOUR_SERVER_IP",
        "port": 443,
        "users": [{
          "id": "YOUR_UUID",
          "alterId": 0,
          "security": "auto"
        }]
      }]
    },
    "streamSettings": {
      "network": "tcp",
      "security": "tls",
      "tlsSettings": {
        "serverName": "proxy.local",
        "allowInsecure": true
      }
    }
  }]
}
```

5. **بچسبانید و وارد کنید** ✅
6. **متصل شوید**

### Android (V2RayNG)

1. **دانلود:** [V2RayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang) یا از [GitHub](https://github.com/2dust/v2rayNG/releases)
2. **اپلیکیشن را باز کنید**
3. **روی "+" کلیک کنید → Import config from clipboard**
4. **پیکربندی JSON را کپی کنید** (همان iOS بالا)
5. **در اپلیکیشن بچسبانید**
6. **روی اتصال کلیک کنید** و **متصل شوید** ✅

### Windows (V2RayN)

1. **دانلود:** [V2RayN](https://github.com/2dust/v2rayN/releases)
2. **استخراج و اجرای V2RayN.exe**
3. **Servers → Add VMess server**
4. **پیکربندی دستی:**
   - **Address:** آی‌پی VPS شما
   - **Port:** 443
   - **UUID:** از نصب
   - **AlterID:** 0
   - **Security:** auto
   - **Network:** tcp
   - **TLS:** tls
   - **AllowInsecure:** true
5. **ذخیره و اتصال** ✅

یا از **Import from clipboard** با پیکربندی JSON استفاده کنید.

### macOS (V2RayX)

1. **دانلود:** [V2RayX](https://github.com/Cenmrev/V2RayX/releases)
2. **نصب و باز کردن**
3. **Configure → Servers → Add**
4. **جزئیات را وارد کنید:**
   - **Address:** آی‌پی VPS شما
   - **Port:** 443
   - **UUID:** از نصب
   - **AlterID:** 0
   - **Security:** auto
   - **Network:** tcp
   - **TLS:** enabled
5. **V2RayX را روشن کنید** ✅

### Linux (V2Ray/Xray)

1. **نصب Xray:**
```bash
bash <(curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh)
```

2. **ایجاد پیکربندی** `/usr/local/etc/xray/config.json`:
```json
{
  "inbounds": [{
    "port": 1080,
    "protocol": "socks",
    "settings": {"udp": true}
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "YOUR_SERVER_IP",
        "port": 443,
        "users": [{"id": "YOUR_UUID", "alterId": 0}]
      }]
    },
    "streamSettings": {
      "network": "tcp",
      "security": "tls",
      "tlsSettings": {"allowInsecure": true}
    }
  }]
}
```

3. **شروع:**
```bash
systemctl start xray
```

4. **استفاده از پروکسی SOCKS:** `127.0.0.1:1080`

---

## 🌐 پیکربندی مرورگر

اپلیکیشن‌های V2Ray معمولاً پروکسی سیستم را به صورت خودکار تنظیم می‌کنند. اگر نه:

- **SOCKS5 Host:** `127.0.0.1`
- **Port:** `1080` (یا هر پورتی که کلاینت V2Ray شما استفاده می‌کند)

بیشتر کلاینت‌های V2Ray دکمه "System Proxy" دارند - فقط آن را روشن کنید!

---

## 🛠️ دستورات مدیریتی

### افزودن کاربر جدید
```bash
cd ssh-socks-proxy/layer7-v2ray-vmess
bash add-user.sh username
```

UUID جدید تولید می‌کند و پیکربندی کلاینت را نمایش می‌دهد.

### بررسی وضعیت سیستم
```bash
cd ../common
bash status.sh
```

وضعیت سرویس Xray را نمایش می‌دهد.

### مشاهده لاگ‌های Xray
```bash
journalctl -fu xray
```

### راه‌اندازی مجدد Xray
```bash
systemctl restart xray
```

### لیست تمام کاربران
```bash
cat /usr/local/etc/xray/users.json
```

نگاشت نام کاربری → UUID را نمایش می‌دهد.

### پشتیبان‌گیری از پیکربندی
```bash
cd ../common
bash backup-config.sh
```

### حذف نصب
```bash
cd ../common
bash uninstall.sh
```

---

## 🔧 عیب‌یابی

### نمی‌توانید متصل شوید؟

**بررسی اجرای Xray:**
```bash
systemctl status xray
```

باید "active (running)" نمایش دهد

**بررسی لاگ‌های Xray:**
```bash
journalctl -xe -u xray
```

به دنبال خطاها بگردید.

**تست پورت 443:**
```bash
ss -tulpn | grep :443
```

باید xray را در حال گوش دادن نمایش دهد.

### "TLS handshake failed"؟

این با گواهی‌های خودامضا طبیعی است. مطمئن شوید:
- کلاینت **"allowInsecure": true** دارد
- یا **"Skip certificate verification"** فعال است

### اپلیکیشن کلاینت کرش می‌کند؟

- مطمئن شوید پیکربندی JSON معتبر است
- غلط‌های تایپی در UUID را بررسی کنید
- صحت آی‌پی سرور را تأیید کنید
- سعی کنید پیکربندی را دوباره وارد کنید

### اتصال کند است؟

**بررسی بار سرور:**
```bash
top
```

**بررسی پهنای باند:**
```bash
vnstat
```

**امتحان تنظیم امنیتی متفاوت:**
در پیکربندی، `"security": "auto"` را به `"security": "aes-128-gcm"` تغییر دهید

### اتصال قطع می‌شود؟

**فعال‌سازی mux (multiplex) در کلاینت:**
در تنظیمات کلاینت V2Ray خود، "Mux" را با همزمانی 8-16 فعال کنید.

---

## ⚡ پیکربندی پیشرفته

### تغییر پورت

ویرایش `/usr/local/etc/xray/config.json`:
```json
"port": 443  ← این را تغییر دهید
```

سپس: `systemctl restart xray`

### فعال‌سازی CDN (Cloudflare)

برای پنهان‌سازی نهایی، مسیریابی از طریق Cloudflare CDN:

1. یک نام دامنه بگیرید
2. آن را به Cloudflare اشاره دهید
3. پروکسی Cloudflare را فعال کنید (ابر نارنجی)
4. Xray را با WebSocket + دامنه پیکربندی کنید
5. به جای آی‌پی از طریق دامنه متصل شوید

*(پیشرفته - مستندات V2Ray را ببینید)*

### گواهی TLS سفارشی

جایگزینی گواهی خودامضا با Let's Encrypt:

```bash
apt install certbot
certbot certonly --standalone -d yourdomain.com
```

پیکربندی را برای استفاده از این موارد به‌روزرسانی کنید:
- `/etc/letsencrypt/live/yourdomain.com/fullchain.pem`
- `/etc/letsencrypt/live/yourdomain.com/privkey.pem`

### تنظیم عملکرد

**غیرفعال کردن لاگ‌گیری** (سریع‌تر):
```json
"log": {
  "loglevel": "none"
}
```

**فعال‌سازی mux در سرور**:
```json
"inbounds": [{
  "muxSettings": {
    "enabled": true,
    "concurrency": 8
  }
}]
```

---

## 📊 جزئیات فنی

- **پروتکل:** VMess (V2Ray)
- **پیاده‌سازی:** Xray-core (نسخه مدرن V2Ray)
- **پورت:** 443 (قابل تنظیم)
- **انتقال:** TCP + TLS
- **رمزنگاری:** AES-128-GCM، ChaCha20-Poly1305
- **احراز هویت:** مبتنی بر UUID
- **چند کاربر:** بله (نامحدود)

### VMess در مقابل SSH

| ویژگی | SSH (لایه‌های ۳-۶) | VMess (لایه ۷) |
|---------|------------------|-----------------|
| **شناسایی** | ممکن | بسیار سخت |
| **عملکرد** | سریع | سریع |
| **سن پروتکل** | بیش از ۳۰ سال | مدرن |
| **هدف** | شل از راه دور | پروکسی/VPN |
| **مقاومت DPI** | متوسط | عالی |
| **اپ‌های موبایل** | استاندارد | تخصصی |

### چگونه کار می‌کند

```
اپلیکیشن کلاینت V2Ray
    ↓
پروتکل VMess
    ↓ TCP + TLS روی پورت 443
شبیه ترافیک HTTPS به نظر می‌رسد
    ↓
سرور Xray (VPS)
    ↓ رمزگشایی و اعتبارسنجی
Freedom (اینترنت مستقیم)
    ↓
اینترنت
```

ناظران شبکه می‌بینند: "ترافیک معمولی HTTPS" ✅
نمی‌توانند آن را به عنوان VPN/پروکسی شناسایی کنند! 🥷

---

## 🔄 تغییر روش‌ها

**از SSH (لایه ۳/۴/۶) به V2Ray:**
```bash
cd ssh-socks-proxy/common
bash uninstall.sh
cd ../layer7-v2ray-vmess
bash install.sh
```

**از V2Ray به SSH:**
همان فرآیند - حذف نصب، سپس نصب لایه‌ای که می‌خواهید.

---

## ❓ سؤالات متداول

**س: آیا V2Ray بهتر از SSH است؟**
**ج:** برای دور زدن سانسور، بله. برای سادگی، خیر. بر اساس نیازهای خود انتخاب کنید.

**س: آیا می‌توانم از این در چین استفاده کنم؟**
**ج:** بله! V2Ray/VMess به طور گسترده در چین استفاده می‌شود. برای قابلیت اطمینان بهتر، افزودن CDN را در نظر بگیرید.

**س: چرا به اپلیکیشن‌های خاص نیاز دارم؟**
**ج:** VMess استاندارد SSH نیست. این یک پروتکل سفارشی است که به کلاینت‌های V2Ray نیاز دارد.

**س: آیا این قانونی است؟**
**ج:** اجرای پروکسی خود در بیشتر کشورها قانونی است. با این حال، قوانین محلی را بررسی کنید.

**س: آیا ISP من می‌تواند V2Ray را شناسایی کند؟**
**ج:** بسیار دشوار. VMess برای شبیه به ترافیک معمولی HTTPS طراحی شده است.

**س: تفاوت بین VMess و VLESS چیست؟**
**ج:** VLESS جدیدتر، سبک‌تر و کمی سریع‌تر است. VMess ویژگی‌های بیشتری دارد. هر دو عالی کار می‌کنند.

**س: آیا می‌توانم یک UUID را با چندین دستگاه به اشتراک بگذارم؟**
**ج:** بله، اما بهتر است برای امنیت و ردیابی کاربران جداگانه ایجاد کنید.

**س: آیا این در ایران/چین/غیره کار می‌کند؟**
**ج:** بله، V2Ray به طور خاص برای این سناریوها طراحی شده است. برای بهترین نتایج با CDN استفاده کنید.

---

## 🎓 منابع

### مستندات رسمی
- [V2Ray Official](https://www.v2ray.com/)
- [Xray Documentation](https://xtls.github.io/)

### اپلیکیشن‌های کلاینت
- **iOS:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977), [Shadowrocket](https://apps.apple.com/app/shadowrocket/id932747118)
- **Android:** [V2RayNG](https://github.com/2dust/v2rayNG), [V2RayN](https://github.com/2dust/v2rayN)
- **Windows:** [V2RayN](https://github.com/2dust/v2rayN), [Qv2ray](https://github.com/Qv2ray/Qv2ray)
- **macOS:** [V2RayX](https://github.com/Cenmrev/V2RayX), [Qv2ray](https://github.com/Qv2ray/Qv2ray)
- **Linux:** [Qv2ray](https://github.com/Qv2ray/Qv2ray), command-line xray

### یادگیری بیشتر
- [V2Ray Beginner's Guide](https://guide.v2fly.org/)
- [Project X Community](https://xtls.github.io/)

---

## 🌟 چرا V2Ray؟

V2Ray/Xray به طور خاص برای مبارزه با سانسور اینترنت ایجاد شده است. برخلاف VPNهای سنتی یا پروکسی‌های SSH:

- **به راحتی مسدود نمی‌شود** - مبهم‌سازی پروتکل
- **طبیعی به نظر می‌رسد** - تقلید از ترافیک معمولی HTTPS
- **به طور فعال توسعه می‌یابد** - به‌روزرسانی‌های منظم برای روش‌های مسدودسازی جدید
- **آزمایش شده در عمل** - استفاده می‌شود توسط میلیون‌ها نفر در کشورهای محدودیت‌دار
- **منبع باز** - شفاف و توسط جامعه هدایت می‌شود

اگر در کشوری با سانسور فعال اینترنت هستید، این بهترین گزینه شماست.

---

[← بازگشت به راهنمای اصلی](../README.md) | [مقایسه تمام روش‌ها →](../README.md#comparison-chart)

**ساخته شده با محبت برای آزادی اینترنت**

---

# 📕 Layer 7: V2Ray VMess Protocol

> **Maximum stealth** • Modern protocol • Multi-user support • Best for censorship

[← Back to main guide](../README.md)

---

## 📖 What is Layer 7?

Layer 7 uses the V2Ray VMess protocol - a modern, purpose-built protocol designed to bypass censorship. It's specifically designed to be undetectable and look like normal HTTPS traffic.

### ✅ Advantages
- 🥷 **Maximum stealth** - Designed to be undetectable
- 🔐 **Modern encryption** - AES-128-GCM or ChaCha20-Poly1305
- 📱 **Native mobile apps** - V2RayNG, NPV Tunnel
- 👥 **Easy multi-user** - Add users without restarting
- 🌐 **Protocol obfuscation** - Doesn't look like VPN traffic
- 🚫 **Censorship resistant** - Used in China, Iran, etc.

### ⚠️ Limitations
- 🔧 **Most complex setup** - Requires understanding V2Ray
- 📱 **Specific apps needed** - Not standard SSH clients
- 🎓 **Learning curve** - More technical than SSH methods
- ⚙️ **Different management** - Uses JSON configs, not SSH users

---

## 🎯 Best For

- 🌍 **Advanced censorship** - China, Iran, Turkmenistan, etc.
- 🔒 **Maximum privacy** - Want the latest technology
- 👥 **Multiple users** - Family, team, organization
- 📱 **Mobile-first users** - Great mobile apps available
- 🚫 **When SSH is blocked** - Even on port 443

**For experts** - If you're new, start with [Layer 4](../layer4-nginx/README.md)

---

## 🚀 Installation

### Step 1: Connect to VPS

```bash
ssh root@YOUR_SERVER_IP
```

### Step 2: Run Installation

```bash
curl -fsSL https://raw.githubusercontent.com/myotgo/ssh-socks-proxy/main/layer7-v2ray-vmess/install.sh -o install.sh && bash install.sh
```

Or from cloned repo:

```bash
cd ssh-socks-proxy/layer7-v2ray-vmess
bash install.sh
```

### Step 3: Save Your Configuration!

**⚠️ CRITICAL:** The installer will show a UUID and JSON config. **SAVE THIS!**

```
UUID: 123e4567-e89b-12d3-a456-426614174000
```

You'll need this UUID to connect. It's also saved in `/root/proxy-installation-info.txt`

**Total time: 10-15 minutes**

---

## 👤 Adding More Users

Unlike SSH-based methods, V2Ray uses UUIDs instead of usernames/passwords.

```bash
cd ssh-socks-proxy/layer7-v2ray-vmess
bash add-user.sh myusername
```

This will:
- Generate a new UUID for that user
- Add to Xray configuration
- Show client configuration JSON
- Save to database for future reference

**Each user gets a unique UUID** - share this with them to connect.

---

## 📱 Connecting from Your Devices

### iPhone/iPad (NPV Tunnel)

1. **Download:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977)
2. **Tap "+" to add connection**
3. **Select "Import from Clipboard"**
4. **Copy this JSON** (from installation output):

```json
{
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "YOUR_SERVER_IP",
        "port": 443,
        "users": [{
          "id": "YOUR_UUID",
          "alterId": 0,
          "security": "auto"
        }]
      }]
    },
    "streamSettings": {
      "network": "tcp",
      "security": "tls",
      "tlsSettings": {
        "serverName": "proxy.local",
        "allowInsecure": true
      }
    }
  }]
}
```

5. **Paste and import** ✅
6. **Connect**

### Android (V2RayNG)

1. **Download:** [V2RayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang) or from [GitHub](https://github.com/2dust/v2rayNG/releases)
2. **Open app**
3. **Tap "+" → Import config from clipboard**
4. **Copy the JSON config** (same as iOS above)
5. **Paste into app**
6. **Tap the connection** and **connect** ✅

### Windows (V2RayN)

1. **Download:** [V2RayN](https://github.com/2dust/v2rayN/releases)
2. **Extract and run V2RayN.exe**
3. **Servers → Add VMess server**
4. **Manual configuration:**
   - **Address:** Your VPS IP
   - **Port:** 443
   - **UUID:** From installation
   - **AlterID:** 0
   - **Security:** auto
   - **Network:** tcp
   - **TLS:** tls
   - **AllowInsecure:** true
5. **Save and connect** ✅

Or use **Import from clipboard** with the JSON config.

### macOS (V2RayX)

1. **Download:** [V2RayX](https://github.com/Cenmrev/V2RayX/releases)
2. **Install and open**
3. **Configure → Servers → Add**
4. **Enter details:**
   - **Address:** Your VPS IP
   - **Port:** 443
   - **UUID:** From installation
   - **AlterID:** 0
   - **Security:** auto
   - **Network:** tcp
   - **TLS:** enabled
5. **Turn on V2RayX** ✅

### Linux (V2Ray/Xray)

1. **Install Xray:**
```bash
bash <(curl -fsSL https://github.com/XTLS/Xray-install/raw/main/install-release.sh)
```

2. **Create config** `/usr/local/etc/xray/config.json`:
```json
{
  "inbounds": [{
    "port": 1080,
    "protocol": "socks",
    "settings": {"udp": true}
  }],
  "outbounds": [{
    "protocol": "vmess",
    "settings": {
      "vnext": [{
        "address": "YOUR_SERVER_IP",
        "port": 443,
        "users": [{"id": "YOUR_UUID", "alterId": 0}]
      }]
    },
    "streamSettings": {
      "network": "tcp",
      "security": "tls",
      "tlsSettings": {"allowInsecure": true}
    }
  }]
}
```

3. **Start:**
```bash
systemctl start xray
```

4. **Use SOCKS proxy:** `127.0.0.1:1080`

---

## 🌐 Browser Configuration

V2Ray apps usually set up system proxy automatically. If not:

- **SOCKS5 Host:** `127.0.0.1`
- **Port:** `1080` (or whatever your V2Ray client uses)

Most V2Ray clients have a "System Proxy" toggle - just turn it on!

---

## 🛠️ Management Commands

### Add New User
```bash
cd ssh-socks-proxy/layer7-v2ray-vmess
bash add-user.sh username
```

Generates new UUID and shows client config.

### Check System Status
```bash
cd ../common
bash status.sh
```

Shows Xray service status.

### View Xray Logs
```bash
journalctl -fu xray
```

### Restart Xray
```bash
systemctl restart xray
```

### List All Users
```bash
cat /usr/local/etc/xray/users.json
```

Shows username → UUID mapping.

### Backup Configuration
```bash
cd ../common
bash backup-config.sh
```

### Uninstall
```bash
cd ../common
bash uninstall.sh
```

---

## 🔧 Troubleshooting

### Can't Connect?

**Check Xray is running:**
```bash
systemctl status xray
```

Should say "active (running)"

**Check Xray logs:**
```bash
journalctl -xe -u xray
```

Look for errors.

**Test port 443:**
```bash
ss -tulpn | grep :443
```

Should show xray listening.

### "TLS handshake failed"?

This is normal with self-signed certificates. Make sure:
- Client has **"allowInsecure": true**
- Or **"Skip certificate verification"** enabled

### Client app crashes?

- Make sure JSON config is valid
- Check for typos in UUID
- Verify server IP is correct
- Try re-importing config

### Slow connection?

**Check server load:**
```bash
top
```

**Check bandwidth:**
```bash
vnstat
```

**Try different security setting:**
In config, change `"security": "auto"` to `"security": "aes-128-gcm"`

### Connection drops?

**Enable mux (multiplex) in client:**
In your V2Ray client settings, enable "Mux" with concurrency 8-16.

---

## ⚡ Advanced Configuration

### Change Port

Edit `/usr/local/etc/xray/config.json`:
```json
"port": 443  ← change this
```

Then: `systemctl restart xray`

### Enable CDN (Cloudflare)

For ultimate stealth, route through Cloudflare CDN:

1. Get a domain name
2. Point it to Cloudflare
3. Enable Cloudflare proxy (orange cloud)
4. Configure Xray with WebSocket + domain
5. Connect via domain instead of IP

*(Advanced - see V2Ray documentation)*

### Custom TLS Certificate

Replace self-signed cert with Let's Encrypt:

```bash
apt install certbot
certbot certonly --standalone -d yourdomain.com
```

Update config to use:
- `/etc/letsencrypt/live/yourdomain.com/fullchain.pem`
- `/etc/letsencrypt/live/yourdomain.com/privkey.pem`

### Performance Tuning

**Disable logging** (faster):
```json
"log": {
  "loglevel": "none"
}
```

**Enable mux on server**:
```json
"inbounds": [{
  "muxSettings": {
    "enabled": true,
    "concurrency": 8
  }
}]
```

---

## 📊 Technical Details

- **Protocol:** VMess (V2Ray)
- **Implementation:** Xray-core (modern V2Ray fork)
- **Port:** 443 (configurable)
- **Transport:** TCP + TLS
- **Encryption:** AES-128-GCM, ChaCha20-Poly1305
- **Authentication:** UUID-based
- **Multi-user:** Yes (unlimited)

### VMess vs SSH

| Feature | SSH (Layers 3-6) | VMess (Layer 7) |
|---------|------------------|-----------------|
| **Detection** | Possible | Very hard |
| **Performance** | Fast | Fast |
| **Protocol age** | 30+ years | Modern |
| **Purpose** | Remote shell | Proxy/VPN |
| **DPI resistance** | Medium | Excellent |
| **Mobile apps** | Standard | Specialized |

### How It Works

```
V2Ray Client App
    ↓
VMess protocol
    ↓ TCP + TLS on port 443
Looks like HTTPS traffic
    ↓
Xray Server (VPS)
    ↓ Decrypts & validates
Freedom (direct internet)
    ↓
Internet
```

Network observers see: "Regular HTTPS traffic" ✅
Can't identify it as VPN/proxy! 🥷

---

## 🔄 Switching Methods

**From SSH-based (Layer 3/4/6) to V2Ray:**
```bash
cd ssh-socks-proxy/common
bash uninstall.sh
cd ../layer7-v2ray-vmess
bash install.sh
```

**From V2Ray back to SSH:**
Same process - uninstall, then install the layer you want.

---

## ❓ FAQ

**Q: Is V2Ray better than SSH?**
**A:** For bypassing censorship, yes. For simplicity, no. Pick based on your needs.

**Q: Can I use this in China?**
**A:** Yes! V2Ray/VMess is widely used in China. Consider adding CDN for even better reliability.

**Q: Why do I need special apps?**
**A:** VMess is not standard SSH. It's a custom protocol requiring V2Ray clients.

**Q: Is this legal?**
**A:** Running your own proxy is legal in most countries. However, check local laws.

**Q: Can my ISP detect V2Ray?**
**A:** Very difficult. VMess is designed to look like normal HTTPS traffic.

**Q: What's the difference between VMess and VLESS?**
**A:** VLESS is newer, lighter, slightly faster. VMess has more features. Both work great.

**Q: Can I share one UUID with multiple devices?**
**A:** Yes, but it's better to create separate users for security and tracking.

**Q: Does this work in Iran/China/etc?**
**A:** Yes, V2Ray is specifically designed for these scenarios. Use with CDN for best results.

---

## 🎓 Resources

### Official Documentation
- [V2Ray Official](https://www.v2ray.com/)
- [Xray Documentation](https://xtls.github.io/)

### Client Apps
- **iOS:** [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977), [Shadowrocket](https://apps.apple.com/app/shadowrocket/id932747118)
- **Android:** [V2RayNG](https://github.com/2dust/v2rayNG), [V2RayN](https://github.com/2dust/v2rayN)
- **Windows:** [V2RayN](https://github.com/2dust/v2rayN), [Qv2ray](https://github.com/Qv2ray/Qv2ray)
- **macOS:** [V2RayX](https://github.com/Cenmrev/V2RayX), [Qv2ray](https://github.com/Qv2ray/Qv2ray)
- **Linux:** [Qv2ray](https://github.com/Qv2ray/Qv2ray), command-line xray

### Learning More
- [V2Ray Beginner's Guide](https://guide.v2fly.org/)
- [Project X Community](https://xtls.github.io/)

---

## 🌟 Why V2Ray?

V2Ray/Xray was created specifically to fight internet censorship. Unlike traditional VPNs or SSH proxies:

- **Not easily blocked** - Protocol obfuscation
- **Looks normal** - Mimics regular HTTPS traffic
- **Actively developed** - Regular updates for new blocking methods
- **Battle-tested** - Used by millions in restrictive countries
- **Open source** - Transparent and community-driven

If you're in a country with active internet censorship, this is your best option.

---

[← Back to main guide](../README.md) | [Compare all methods →](../README.md#comparison-chart)

**Made with ❤️ for internet freedom**
