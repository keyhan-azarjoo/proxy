# 🔐 پروکسی خصوصی SSH SOCKS - دسترسی ایمن به اینترنت

> **سرور VPS خود را در ۵ دقیقه به یک پروکسی خصوصی و امن تبدیل کنید**
> نیازی به دانش فنی نیست • گزینه‌های متعدد نصب • حریم خصوصی کامل

---

## 📖 این ابزار چیست؟

این ابزار به شما کمک می‌کند تا با استفاده از یک سرور VPS که خودتان کنترل می‌کنید، یک **پروکسی خصوصی اینترنت** ایجاد کنید. آن را مانند یک VPN شخصی در نظر بگیرید، اما با مزایای زیر:

✅ **شما آن را کنترل می‌کنید** - بدون ردیابی توسط شخص ثالث
✅ **آدرس IP ثابت** - عالی برای دسترسی به سرویس‌های محدود به منطقه جغرافیایی
✅ **اتصال رمزگذاری شده** - ترافیک اینترنت شما محافظت می‌شود
✅ **مقرون به صرفه** - از هر VPS ارزان قیمت استفاده کنید (۳ تا ۵ دلار در ماه)

---

## 🎯 این ابزار برای چه کسانی است؟

- ✈️ **مسافران** که نیاز به دسترسی به سرویس‌های کشور خود دارند
- 🏢 **کارکنان دورکار** که به اتصالات امن نیاز دارند
- 🎮 **گیمرها** که می‌خواهند اتصال پایدار و با تاخیر کم داشته باشند
- 🔒 **کاربران مراقب حریم خصوصی** که می‌خواهند کنترل داده‌های خود را در دست داشته باشند
- 🌍 **هر کسی** که نیاز به دور زدن محدودیت‌های جغرافیایی دارد

---

## 🚀 شروع سریع (۳ مرحله)

### مرحله ۱: یک سرور VPS تهیه کنید
شما به یک سرور Ubuntu نیاز دارید. ارائه‌دهندگان پیشنهادی:
- **DigitalOcean** - ۴ دلار در ماه ([دریافت ۲۰۰ دلار اعتبار](https://www.digitalocean.com/))
- **Vultr** - ۳.۵۰ دلار در ماه ([ثبت نام](https://www.vultr.com/))
- **Hetzner** - ۳.۷۹ یورو در ماه ([ثبت نام](https://www.hetzner.com/))
- **هر ارائه‌دهنده VPS با Ubuntu**

### مرحله ۲: روش نصب خود را انتخاب کنید
ما **۵ روش مختلف** داریم - یکی را بر اساس نیازهای خود انتخاب کنید:

| روش | سختی | بهترین برای | پورت | سطح مخفی‌سازی |
|--------|-----------|----------|------|---------------|
| [**لایه ۳: SSH پایه**](layer3-basic/README.md) | ⭐ آسان‌ترین | کاربران تازه‌کار، تست | 22 | ⭐⭐ |
| [**لایه ۴: Nginx Proxy**](layer4-nginx/README.md) | ⭐⭐ آسان | اکثر کاربران، قابل اعتماد | 443 | ⭐⭐⭐ |
| [**لایه ۶: Stunnel TLS**](layer6-stunnel/README.md) | ⭐⭐⭐ متوسط | نیاز به امنیت بیشتر | 443 | ⭐⭐⭐⭐ |
| [**لایه ۷: V2Ray VMess**](layer7-v2ray-vmess/README.md) | ⭐⭐⭐⭐ پیشرفته | حداکثر مخفی‌سازی | 443 | ⭐⭐⭐⭐⭐ |
| [**لایه ۷: دامنه واقعی + TLS (VLESS/Trojan)**](layer7-real-domain/README.md) | ⭐⭐⭐⭐⭐ حرفه‌ای | سخت‌ترین فیلترینگ، بیشترین مخفی‌سازی | 443 | ⭐⭐⭐⭐⭐ |

**🔰 کاربران جدید:** با **لایه ۴** شروع کنید - بهترین تعادل بین آسانی و قابلیت اطمینان است.

### مرحله ۳: نصب (با یک دستور!)
روی روش انتخابی خود در بالا کلیک کنید تا دستورالعمل‌های دقیق را ببینید.

---

## 📱 دستگاه‌های پشتیبانی شده

پس از نصب، می‌توانید از این دستگاه‌ها متصل شوید:

- **📱 iPhone/iPad** - استفاده از [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977) یا [Shadowrocket](https://apps.apple.com/app/shadowrocket/id932747118)
- **🤖 Android** - استفاده از [Net Mod](https://play.google.com/store/apps/details?id=com.netmod.app)، [V2RayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang) یا [Surfboard](https://play.google.com/store/apps/details?id=com.getsurfboard)
- **💻 Windows** - استفاده از [PuTTY](https://www.putty.org/)، [V2RayN](https://github.com/2dust/v2rayN) یا SSH داخلی
- **🍎 macOS** - استفاده از Terminal (داخلی) یا [V2RayX](https://github.com/Cenmrev/V2RayX)
- **🐧 Linux** - استفاده از SSH (داخلی) یا کلاینت‌های V2Ray

---

## 🎓 راهنمای نصب دقیق

### روش‌های آسان (پیشنهادی برای مبتدیان)

#### [📘 لایه ۳: SSH پایه](layer3-basic/README.md)
- ⭐ **سختی:** آسان‌ترین
- ⚡ **زمان نصب:** ۳-۵ دقیقه
- 🔌 **پورت:** 22 (پورت استاندارد SSH)
- 🛡️ **امنیت:** رمزگذاری پایه SSH
- 📖 **بهترین برای:** تست، یادگیری، نصب اولیه
- [→ برای راهنمای کامل اینجا کلیک کنید](layer3-basic/README.md)

#### [📗 لایه ۴: Nginx TCP Proxy](layer4-nginx/README.md)
- ⭐⭐ **سختی:** آسان
- ⚡ **زمان نصب:** ۵-۷ دقیقه
- 🔌 **پورت:** 443 (پورت HTTPS - سخت‌تر مسدود می‌شود)
- 🛡️ **امنیت:** رمزگذاری SSH از طریق پورت HTTPS
- 📖 **بهترین برای:** اکثر کاربران، استفاده روزمره، قابلیت اطمینان
- **⭐ پیشنهاد می‌شود برای اکثر کاربران**
- [→ برای راهنمای کامل اینجا کلیک کنید](layer4-nginx/README.md)

### روش‌های پیشرفته (برای نیازهای خاص)

#### [📙 لایه ۶: Stunnel TLS Wrapper](layer6-stunnel/README.md)
- ⭐⭐⭐ **سختی:** متوسط
- ⚡ **زمان نصب:** ۷-۱۰ دقیقه
- 🔌 **پورت:** 443 (پورت HTTPS)
- 🛡️ **امنیت:** رمزگذاری دوگانه (TLS + SSH)
- 📖 **بهترین برای:** نیازهای امنیتی بالا، فایروال‌های سخت‌گیرانه
- [→ برای راهنمای کامل اینجا کلیک کنید](layer6-stunnel/README.md)

#### [📕 لایه ۷: V2Ray VMess](layer7-v2ray-vmess/README.md)
- ⭐⭐⭐⭐ **سختی:** پیشرفته
- ⚡ **زمان نصب:** ۱۰-۱۵ دقیقه
- 🔌 **پورت:** 443 (پورت HTTPS)
- 🛡️ **امنیت:** پروتکل مدرن، حداکثر مخفی‌سازی
- 📖 **بهترین برای:** دور زدن سانسور پیشرفته
- **پشتیبانی از چندین کاربر**
- [→ برای راهنمای کامل اینجا کلیک کنید](layer7-v2ray-vmess/README.md)

#### [🥇 لایه ۷: دامنه واقعی + TLS (VLESS/Trojan)](layer7-real-domain/README.md)
- ⭐⭐⭐⭐⭐ **سختی:** حرفه‌ای
- ⚡ **زمان نصب:** ۱۵-۲۰ دقیقه
- 🔌 **پورت:** 443 (HTTPS واقعی)
- 🛡️ **امنیت:** TLS واقعی با گواهی معتبر
- 📖 **بهترین برای:** سخت‌ترین فیلترینگ، بیشترین مخفی‌سازی
- **دامنه واقعی + اثر انگشت TLS طبیعی**
- [→ برای راهنمای کامل اینجا کلیک کنید](layer7-real-domain/README.md)

---

## 🛠️ دستورات مدیریت

پس از نصب، می‌توانید پروکسی خود را با این دستورات ساده مدیریت کنید:

```bash
# رفتن به پوشه common
cd common

# افزودن کاربر جدید
bash add-user.sh

# حذف کاربر
bash delete-user.sh username

# لیست همه کاربران
bash list-users.sh

# بررسی وضعیت سیستم
bash status.sh

# پشتیبان‌گیری از پیکربندی
bash backup-config.sh

# حذف کامل
bash uninstall.sh
```

---

## ❓ سوالات متداول

### س: کدام روش را باید انتخاب کنم؟
**ج:** برای اکثر کاربران، **لایه ۴ (Nginx)** بهترین انتخاب است. راه‌اندازی آن آسان است و به طور قابل اعتماد کار می‌کند.

### س: آیا به دانش فنی نیاز دارم؟
**ج:** خیر! فقط دستورات را از راهنما کپی و جایگذاری کنید. هر راهنما دارای تصاویر گام به گام است.

### س: هزینه آن چقدر است؟
**ج:** فقط هزینه VPS، معمولاً ۳ تا ۵ دلار در ماه. هیچ هزینه دیگری وجود ندارد.

### س: آیا می‌توانم آن را روی چندین دستگاه استفاده کنم؟
**ج:** بله! یک حساب کاربری برای هر دستگاه ایجاد کنید، یا یک حساب را در همه دستگاه‌های خود به اشتراک بگذارید.

### س: آیا قانونی است؟
**ج:** بله، اجرای پروکسی روی سرور خود قانونی است. با این حال، قوانین کشور خود را در مورد استفاده از VPN/پروکسی بررسی کنید.

### س: آیا سرعت اینترنت من را کاهش می‌دهد؟
**ج:** سرعت شما به موقعیت VPS و پهنای باند آن بستگی دارد. یک VPS نزدیک به موقعیت جغرافیایی خود را برای بهترین سرعت انتخاب کنید.

### س: اگر چیزی خراب شد چه باید کرد؟
**ج:** هر نصب به طور خودکار پشتیبان‌گیری ایجاد می‌کند. همچنین می‌توانید `bash uninstall.sh` را برای حذف کامل همه چیز اجرا کنید.

### س: آیا می‌توانم بین روش‌ها جابجا شوم؟
**ج:** بله، اما ابتدا `bash uninstall.sh` را اجرا کنید تا نصب قبلی را به طور کامل حذف کنید، سپس روش جدید را نصب کنید.

---

## 🔒 امنیت و حریم خصوصی

### آنچه در نسخه ۲.۰ اصلاح کردیم
- ✅ ورودی امن رمز عبور (بدون افشای خط فرمان)
- ✅ اعتبارسنجی ورودی برای جلوگیری از حملات تزریق
- ✅ مدیریت صحیح گواهینامه
- ✅ پشتیبان‌گیری خودکار از پیکربندی
- ✅ اعتبارسنجی سرویس و بازیابی خطا
- ✅ ثبت دقیق برای عیب‌یابی

### بهترین شیوه‌های امنیتی
1. **از رمزهای عبور قوی استفاده کنید** - حداقل ۱۲ کاراکتر
2. **VPS خود را به‌روز نگه دارید** - ماهانه `apt update && apt upgrade` را اجرا کنید
3. **اطلاعات خود را به اشتراک نگذارید** - برای هر شخص کاربر جداگانه ایجاد کنید
4. **از فایروال UFW استفاده کنید** - از قبل توسط اسکریپت‌های ما پیکربندی شده است
5. **لاگ‌های خود را نظارت کنید** - به طور دوره‌ای `bash status.sh` را اجرا کنید

---

## 📊 جدول مقایسه

| ویژگی | لایه ۳ | لایه ۴ | لایه ۶ | لایه ۷ |
|---------|---------|---------|---------|---------|
| **سختی نصب** | ⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **پورت استفاده شده** | 22 | 443 | 443 | 443 |
| **سطح مخفی‌سازی** | کم | متوسط | بالا | حداکثر |
| **سرعت** | سریع | سریع | سریع | سریع |
| **قابلیت اطمینان** | بالا | بالا | بالا | بالا |
| **چند کاربره** | بله | بله | بله | بله |
| **اپلیکیشن‌های سازگار** | همه SSH | همه SSH | NPV Tunnel | اپلیکیشن‌های V2Ray |
| **مسدود شدن توسط DPI** | گاهی | به ندرت | خیلی کم | تقریباً هرگز |

**DPI** = Deep Packet Inspection (فیلتر شبکه پیشرفته)

---

## 🆘 نیاز به کمک دارید؟

### خطا در حین نصب دریافت می‌کنید؟
1. مطمئن شوید که از **Ubuntu** استفاده می‌کنید (۱۸.۰۴، ۲۰.۰۴، ۲۲.۰۴ یا ۲۴.۰۴)
2. به عنوان کاربر **root** اجرا کنید (یا از `sudo bash install.sh` استفاده کنید)
3. بررسی کنید که پورت ۴۴۳ توسط سرویس دیگری استفاده نمی‌شود
4. مشاهده خطاهای دقیق: `journalctl -xe`

### پس از نصب نمی‌توانید متصل شوید؟
1. بررسی فایروال: `ufw status`
2. بررسی وضعیت سرویس: `bash status.sh`
3. تأیید IP سرور خود: `curl ifconfig.me`
4. مطمئن شوید که از پورت صحیح استفاده می‌کنید

### به کمک بیشتری نیاز دارید؟
- 📖 راهنمای دقیق لایه انتخابی خود را بررسی کنید
- 🐛 [گزارش مشکلات در GitHub](https://github.com/myotgo/ssh-socks-proxy/issues)
- 💬 مشکلات موجود را برای راه‌حل‌ها بخوانید

---

## 📜 تغییرات نسخه ۲.۰

### 🎉 بهبودهای عمده
- ✨ **سازماندهی بهتر** - هر روش در پوشه خاص خود
- 🔒 **امنیت بهبود یافته** - رفع همه آسیب‌پذیری‌های رمز عبور و ورودی
- 📚 **مستندات مناسب مبتدیان** - راهنماهای گام به گام بدون اصطلاحات فنی
- 🛠️ **ابزارهای مدیریت** - دستورات آسان برای مدیریت کاربران و سیستم
- ✅ **قابلیت اطمینان** - پشتیبان‌گیری خودکار، اعتبارسنجی، بازیابی خطا
- 📊 **وضعیت سیستم** - با یک دستور ببینید چه چیزی در حال اجراست
- 🗑️ **حذف کامل** - حذف کامل همه چیز
- 💾 **پشتیبان‌گیری/بازیابی** - ذخیره و انتقال پیکربندی شما

### 🔧 بهبودهای فنی
- بررسی‌های پیش از نصب
- اعتبارسنجی سرویس پس از هر مرحله
- پشتیبان‌گیری خودکار از پیکربندی
- پیام‌های خطای بهبود یافته
- ثبت برای عیب‌یابی
- پاکسازی ورودی
- بهبودهای گواهینامه

---

## 📁 ساختار پروژه

```
ssh-socks-proxy/
├── README.md (این فایل)
├── common/                    # ابزارهای مدیریت
│   ├── add-user.sh           # افزودن کاربران پروکسی
│   ├── delete-user.sh        # حذف کاربران
│   ├── list-users.sh         # لیست همه کاربران
│   ├── status.sh             # بررسی وضعیت سیستم
│   ├── backup-config.sh      # پشتیبان‌گیری از پیکربندی
│   └── uninstall.sh          # حذف کامل
├── layer3-basic/             # روش SSH پایه
│   ├── install.sh
│   └── README.md
├── layer4-nginx/             # روش Nginx proxy
│   ├── install.sh
│   └── README.md
├── layer6-stunnel/           # روش Stunnel TLS
│   ├── install.sh
│   └── README.md
└── layer7-v2ray-vmess/       # روش V2Ray VMess
?   ??? install.sh
?   ??? add-user.sh
?   ??? README.md
??? layer7-real-domain/       # ??? ????? ?? TLS ?????
    ??? install.sh
    ??? images/
    ??? README.md
```

---

## 📄 مجوز

این پروژه رایگان و متن‌باز است. هر طور که می‌خواهید از آن استفاده کنید!

---

## ⭐ پشتیبانی از این پروژه

اگر این پروژه به شما کمک کرد، لطفاً:
- ⭐ این مخزن را در GitHub ستاره دهید
- 📢 آن را با دوستانی که به ابزارهای حریم خصوصی نیاز دارند به اشتراک بگذارید
- 🐛 باگ‌ها را گزارش دهید یا بهبودها را پیشنهاد دهید
- 💡 کد یا مستندات را مشارکت دهید

---

## 🙏 اعتبارات

- ایده اصلی توسط [myotgo](https://github.com/myotgo)
- بهبودهای نسخه ۲.۰: سخت‌تر کردن امنیت، مستندات کاربرپسند، ابزارهای مدیریت
- ساخته شده با: OpenSSH، Nginx، Stunnel، Xray (V2Ray)

---

**با ❤️ برای آزادی اینترنت و حریم خصوصی ساخته شده است**

*آخرین به‌روزرسانی: ژانویه ۲۰۲۶ • نسخه ۲.۰.۰*

---

# 🔐 SSH SOCKS Proxy - Private Internet Access

> **Turn your VPS into a secure private proxy in 5 minutes**
> No technical knowledge required • Multiple setup options • Complete privacy

---

## 📖 What is This?

This tool helps you create your own **private internet proxy** using a VPS server you control. Think of it as your own personal VPN, but:

✅ **You control it** - No third-party tracking
✅ **Fixed IP address** - Perfect for accessing region-locked services
✅ **Encrypted connection** - Your internet traffic is protected
✅ **Cost-effective** - Use any cheap VPS ($3-5/month)

---

## 🎯 Who is This For?

- ✈️ **Travelers** who need to access home-country services
- 🏢 **Remote workers** needing secure connections
- 🎮 **Gamers** who want stable, low-latency connections
- 🔒 **Privacy-conscious users** who want control over their data
- 🌍 **Anyone** needing to bypass geographic restrictions

---

## 🚀 Quick Start (3 Steps)

### Step 1: Get a VPS Server
You need an Ubuntu server. Recommended providers:
- **DigitalOcean** - $4/month ([Get $200 credit](https://www.digitalocean.com/))
- **Vultr** - $3.50/month ([Sign up](https://www.vultr.com/))
- **Hetzner** - €3.79/month ([Sign up](https://www.hetzner.com/))
- **Any Ubuntu VPS provider**

### Step 2: Choose Your Setup Method
We have **5 different methods** - pick one based on your needs:

| Method | Difficulty | Best For | Port | Stealth Level |
|--------|-----------|----------|------|---------------|
| [**Layer 3: Basic SSH**](layer3-basic/README.md) | ⭐ Easiest | First-time users, testing | 22 | ⭐⭐ |
| [**Layer 4: Nginx Proxy**](layer4-nginx/README.md) | ⭐⭐ Easy | Most users, reliable | 443 | ⭐⭐⭐ |
| [**Layer 6: Stunnel TLS**](layer6-stunnel/README.md) | ⭐⭐⭐ Moderate | Extra security needed | 443 | ⭐⭐⭐⭐ |
| [**Layer 7: V2Ray VMess**](layer7-v2ray-vmess/README.md) | ⭐⭐⭐⭐ Advanced | Maximum stealth | 443 | ⭐⭐⭐⭐⭐ |
| [**Layer 7: Real Domain + TLS (VLESS/Trojan)**](layer7-real-domain/README.md) | ⭐⭐⭐⭐⭐ Expert | Hardest censorship, maximum stealth | 443 | ⭐⭐⭐⭐⭐ |

**🔰 New users:** Start with **Layer 4** - it's the best balance of ease and reliability.

### Step 3: Install (One Command!)
Click your chosen method above to see detailed instructions.

---

## 📱 Supported Devices

After installation, you can connect from:

- **📱 iPhone/iPad** - Use [NPV Tunnel](https://apps.apple.com/app/npv-tunnel/id1629891977) or [Shadowrocket](https://apps.apple.com/app/shadowrocket/id932747118)
- **🤖 Android** - Use [Net Mod](https://play.google.com/store/apps/details?id=com.netmod.app), [V2RayNG](https://play.google.com/store/apps/details?id=com.v2ray.ang), or [Surfboard](https://play.google.com/store/apps/details?id=com.getsurfboard)
- **💻 Windows** - Use [PuTTY](https://www.putty.org/), [V2RayN](https://github.com/2dust/v2rayN), or built-in SSH
- **🍎 macOS** - Use Terminal (built-in) or [V2RayX](https://github.com/Cenmrev/V2RayX)
- **🐧 Linux** - Use SSH (built-in) or V2Ray clients

---

## 🎓 Detailed Setup Guides

### Easy Methods (Recommended for Beginners)

#### [📘 Layer 3: Basic SSH](layer3-basic/README.md)
- ⭐ **Difficulty:** Easiest
- ⚡ **Setup time:** 3-5 minutes
- 🔌 **Port:** 22 (standard SSH port)
- 🛡️ **Security:** Basic SSH encryption
- 📖 **Best for:** Testing, learning, first-time setup
- [→ Click here for full guide](layer3-basic/README.md)

#### [📗 Layer 4: Nginx TCP Proxy](layer4-nginx/README.md)
- ⭐⭐ **Difficulty:** Easy
- ⚡ **Setup time:** 5-7 minutes
- 🔌 **Port:** 443 (HTTPS port - harder to block)
- 🛡️ **Security:** SSH encryption via HTTPS port
- 📖 **Best for:** Most users, everyday use, reliability
- **⭐ RECOMMENDED FOR MOST USERS**
- [→ Click here for full guide](layer4-nginx/README.md)

### Advanced Methods (For Specific Needs)

#### [📙 Layer 6: Stunnel TLS Wrapper](layer6-stunnel/README.md)
- ⭐⭐⭐ **Difficulty:** Moderate
- ⚡ **Setup time:** 7-10 minutes
- 🔌 **Port:** 443 (HTTPS port)
- 🛡️ **Security:** Double encryption (TLS + SSH)
- 📖 **Best for:** High-security needs, strict firewalls
- [→ Click here for full guide](layer6-stunnel/README.md)

#### [📕 Layer 7: V2Ray VMess](layer7-v2ray-vmess/README.md)
- ⭐⭐⭐⭐ **Difficulty:** Advanced
- ⚡ **Setup time:** 10-15 minutes
- 🔌 **Port:** 443 (HTTPS port)
- 🛡️ **Security:** Modern protocol, maximum stealth
- 📖 **Best for:** Circumventing advanced censorship
- **Multiple users supported**
- [→ Click here for full guide](layer7-v2ray-vmess/README.md)

#### [🥇 Layer 7: Real Domain + TLS (VLESS/Trojan)](layer7-real-domain/README.md)
- ⭐⭐⭐⭐⭐ **Difficulty:** Expert
- ⚡ **Setup time:** 15-20 minutes
- 🔌 **Port:** 443 (real HTTPS)
- 🛡️ **Security:** Valid TLS certificate with real domain
- 📖 **Best for:** Harshest censorship, maximum stealth
- **Real domain + normal TLS fingerprint**
- [→ Click here for full guide](layer7-real-domain/README.md)

---

## 🛠️ Management Commands

After installation, you can manage your proxy with these simple commands:

```bash
# Go to the common folder
cd common

# Add a new user
bash add-user.sh

# Delete a user
bash delete-user.sh username

# List all users
bash list-users.sh

# Check system status
bash status.sh

# Backup your configuration
bash backup-config.sh

# Completely uninstall
bash uninstall.sh
```

---

## ❓ Frequently Asked Questions

### Q: Which method should I choose?
**A:** For most users, **Layer 4 (Nginx)** is the best choice. It's easy to set up and works reliably.

### Q: Do I need technical knowledge?
**A:** No! Just copy and paste the commands from the guide. Each guide has step-by-step screenshots.

### Q: How much does it cost?
**A:** Only the VPS cost, usually $3-5 per month. No other fees.

### Q: Can I use it on multiple devices?
**A:** Yes! Create one user account per device, or share one account across all your devices.

### Q: Is it legal?
**A:** Yes, running a proxy on your own server is legal. However, check your country's laws regarding VPN/proxy usage.

### Q: Will it slow down my internet?
**A:** Your speed depends on your VPS location and bandwidth. Choose a VPS geographically close to you for best speed.

### Q: What if something breaks?
**A:** Each installation creates automatic backups. You can also run `bash uninstall.sh` to remove everything.

### Q: Can I switch between methods?
**A:** Yes, but run `bash uninstall.sh` first to cleanly remove the old installation before installing a new method.

---

## 🔒 Security & Privacy

### What We Fixed in Version 2.0
- ✅ Secure password input (no command-line exposure)
- ✅ Input validation to prevent injection attacks
- ✅ Proper certificate handling
- ✅ Automatic configuration backups
- ✅ Service validation and error recovery
- ✅ Detailed logging for troubleshooting

### Security Best Practices
1. **Use strong passwords** - At least 12 characters
2. **Keep your VPS updated** - Run `apt update && apt upgrade` monthly
3. **Don't share your credentials** - Create separate users for each person
4. **Use UFW firewall** - Already configured by our scripts
5. **Monitor your logs** - Run `bash status.sh` periodically

---

## 📊 Comparison Chart

| Feature | Layer 3 | Layer 4 | Layer 6 | Layer 7 |
|---------|---------|---------|---------|---------|
| **Setup Difficulty** | ⭐ | ⭐⭐ | ⭐⭐⭐ | ⭐⭐⭐⭐ |
| **Port Used** | 22 | 443 | 443 | 443 |
| **Stealth Level** | Low | Medium | High | Maximum |
| **Speed** | Fast | Fast | Fast | Fast |
| **Reliability** | High | High | High | High |
| **Multi-user** | Yes | Yes | Yes | Yes |
| **Compatible Apps** | All SSH | All SSH | NPV Tunnel | V2Ray apps |
| **Blocked by DPI** | Sometimes | Rarely | Very Rare | Almost Never |

**DPI** = Deep Packet Inspection (advanced network filtering)

---

## 🆘 Need Help?

### Getting Errors During Installation?
1. Make sure you're using **Ubuntu** (18.04, 20.04, 22.04, or 24.04)
2. Run as **root** user (or use `sudo bash install.sh`)
3. Check that port 443 is not being used by another service
4. View detailed errors: `journalctl -xe`

### Can't Connect After Installation?
1. Check firewall: `ufw status`
2. Check service status: `bash status.sh`
3. Verify your server IP: `curl ifconfig.me`
4. Make sure you're using the correct port

### Need More Help?
- 📖 Check the detailed guide for your chosen layer
- 🐛 [Report issues on GitHub](https://github.com/myotgo/ssh-socks-proxy/issues)
- 💬 Read existing issues for solutions

---

## 📜 What's New in Version 2.0

### 🎉 Major Improvements
- ✨ **Better organization** - Each method in its own folder
- 🔒 **Enhanced security** - Fixed all password and input vulnerabilities
- 📚 **Beginner-friendly docs** - Step-by-step guides with no jargon
- 🛠️ **Management tools** - Easy commands to manage users and system
- ✅ **Reliability** - Automatic backups, validation, error recovery
- 📊 **System status** - See what's running with one command
- 🗑️ **Clean uninstall** - Remove everything completely
- 💾 **Backup/restore** - Save and migrate your configuration

### 🔧 Technical Improvements
- Pre-flight checks before installation
- Service validation after each step
- Automatic configuration backups
- Improved error messages
- Logging for troubleshooting
- Input sanitization
- Certificate improvements

---

## 📁 Project Structure

```
ssh-socks-proxy/
├── README.md (this file)
├── common/                    # Management tools
│   ├── add-user.sh           # Add proxy users
│   ├── delete-user.sh        # Remove users
│   ├── list-users.sh         # List all users
│   ├── status.sh             # Check system status
│   ├── backup-config.sh      # Backup configuration
│   └── uninstall.sh          # Complete uninstall
├── layer3-basic/             # Basic SSH method
│   ├── install.sh
│   └── README.md
├── layer4-nginx/             # Nginx proxy method
│   ├── install.sh
│   └── README.md
├── layer6-stunnel/           # Stunnel TLS method
│   ├── install.sh
│   └── README.md
└── layer7-v2ray-vmess/       # V2Ray VMess method
?   ??? install.sh
?   ??? add-user.sh
?   ??? README.md
??? layer7-real-domain/       # Real domain + TLS method
    ??? install.sh
    ??? images/
    ??? README.md
```

---

## 📄 License

This project is free and open source. Use it however you like!

---

## ⭐ Support This Project

If this helped you, please:
- ⭐ Star this repository on GitHub
- 📢 Share it with friends who need privacy tools
- 🐛 Report bugs or suggest improvements
- 💡 Contribute code or documentation

---

## 🙏 Credits

- Original concept by [myotgo](https://github.com/myotgo)
- Version 2.0 improvements: Security hardening, user-friendly docs, management tools
- Built with: OpenSSH, Nginx, Stunnel, Xray (V2Ray)

---

**Made with ❤️ for internet freedom and privacy**

*Last updated: January 2026 • Version 2.0.0*
