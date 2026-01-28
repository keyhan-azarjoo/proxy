# 🥇 لایه ۷: دامنه واقعی + TLS (VLESS/Trojan)

> **بهترین روش کلی (سخت‌ترین برای فیلتر شدن، بسیار امن)**
> تونل TLS واقعی که دقیقا مثل یک وب‌سایت HTTPS عادی دیده می‌شود (پورت 443)

[← بازگشت به راهنمای اصلی](../README.md)

---

## ✅ چرا این روش بهترین است؟

این روش، ترافیک شما را داخل **TLS واقعی با دامنه واقعی** می‌برد. نتیجه: برای DPI و فیلترینگ، ترافیک شما دقیقا شبیه مرور وب عادی است.

**ویژگی‌های کلیدی:**
- دامنه واقعی (Real Domain)
- گواهی TLS معتبر (Let's Encrypt یا Cloudflare)
- اثر انگشت TLS طبیعی
- بدون امضای واضح پروکسی

**نتیجه:** ترافیک شما از مرور وب معمولی قابل تشخیص نیست.

---

## 🥇 TOP Setup (رتبه ۱)

**VLESS / Trojan روی TLS واقعی (پورت 443)**

چرا بهترین است:
- دقیقا شبیه یک وب‌سایت HTTPS معمولی
- گواهی معتبر مرورگر (Let's Encrypt / Cloudflare)
- عبور از:
  - DPI
  - فیلتر SNI
  - Active Probing
  - تشخیص اثر انگشت ترافیک

**امنیت:** ⭐⭐⭐⭐⭐
**مخفی‌سازی:** ⭐⭐⭐⭐⭐
**سرعت:** ⭐⭐⭐⭐☆

---

## ⚠️ حقیقت مهم (خیلی کوتاه)

❌ شما نمی‌توانید یک دامنه رایگان را **کاملا فقط با CMD** و بدون هیچ مرحله دستی ثبت کنید.

✅ اما بعد از **یک‌بار ورود دستی**، همه چیز 100% قابل اسکریپت است.

---

## ✅ واقعیت عملی (رایگان، واقعی، قابل استفاده)

### 🥇 DuckDNS (زیردامنه رایگان) — بهترین گزینه

**یک‌بار با مرورگر وارد شوید و تمام!**

1. وارد شوید: https://duckdns.org
2. با GitHub یا Google لاگین کنید
3. یک نام انتخاب کنید (مثلا):

```
myproxy123.duckdns.org
```

4. TOKEN را کپی کنید

بعد از این مرحله، دیگر به وب‌سایت نیاز ندارید.

---

## 🧭 مراحل نصب (کامل)

### ✅ مرحله ۱ — دامنه را یک‌بار بسازید (دستی)

> اگر دامنه پولی دارید، همین حالا به IP سرور اشاره‌اش دهید.
> اگر رایگان می‌خواهید، DuckDNS بهترین و آسان‌ترین است.

![ثبت دامنه رایگان](./images/2.png)
*نمونه ثبت دامنه (جایگزین کنید)*

---

### ✅ مرحله ۲ — آپدیت DNS با CMD (پس از یک‌بار ثبت)

**Linux / macOS:**
```bash
curl "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip="
```

**Windows CMD / PowerShell:**
```powershell
curl "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip="
```

**PowerShell (پیشنهادی):**
```powershell
Invoke-WebRequest "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip=" -UseBasicParsing
```

✔ دامنه فعال شد
✔ به IP سرور اشاره کرد
✔ قابل تکرار و اسکریپت‌شدن

![آپدیت دامنه با CMD](./images/3.png)
*نمونه آپدیت DNS (جایگزین کنید)*

---

### ✅ مرحله ۳ — گرفتن TLS رایگان (برای مخفی‌سازی واقعی)

```bash
sudo certbot certonly --standalone \
  -d myproxy123.duckdns.org \
  --non-interactive \
  --agree-tos \
  -m admin@example.com
```

✔ گواهی معتبر مرورگر
✔ رایگان
✔ قابل تمدید خودکار

![صدور TLS واقعی](./images/4.png)
*نمونه صدور گواهی TLS (جایگزین کنید)*

---

### ✅ مرحله ۴ — نصب خودکار VLESS با TLS واقعی (اسکریپت)

```bash
cd ssh-socks-proxy/layer7-real-domain
bash install.sh
```

اسکریپت از شما دامنه و ایمیل را می‌گیرد و:
- گواهی معتبر TLS می‌گیرد
- VLESS روی 443 راه‌اندازی می‌کند
- همه چیز را آماده اتصال می‌کند

![نصب لایه ۷](./images/5.png)
*نمونه نصب (جایگزین کنید)*

---

## 🔁 آپدیت خودکار DNS (اختیاری)

```bash
*/5 * * * * curl -fs "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip=" >/dev/null
```

---

## 🧩 اتصال کلاینت (نمونه VLESS)

**آدرس سرور:** دامنه واقعی شما (نه IP)

نمونه کانفیگ (V2Ray/Xray):
```json
{
  "outbounds": [{
    "protocol": "vless",
    "settings": {
      "vnext": [{
        "address": "myproxy123.duckdns.org",
        "port": 443,
        "users": [{"id": "YOUR_UUID", "encryption": "none"}]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "security": "tls",
      "tlsSettings": {"serverName": "myproxy123.duckdns.org", "allowInsecure": false},
      "wsSettings": {"path": "/YOUR_PATH"}
    }
  }]
}
```

---

## ✅ نتیجه نهایی (خلاصه واقعی)

| سوال | پاسخ |
|------|------|
| کاملا رایگان؟ | ✅ بله |
| کاملا CMD بدون مرورگر؟ | ❌ نه (غیرممکن) |
| بعد از یک بار ورود، اتوماسیون کامل؟ | ✅ بله |
| مناسب برای پروکسی + TLS واقعی؟ | ✅ بله |
| سخت برای فیلتر شدن؟ | ✅ بسیار سخت |

---

## 🔥 پیشنهاد نهایی (بدون تعارف)

اگر می‌خواهید:
- رایگان
- قابل اسکریپت
- سخت‌ترین فیلترینگ را رد کند
- کاملا حرفه‌ای و قابل اعتماد

👉 **DuckDNS + Let's Encrypt + TLS روی 443 (VLESS/Trojan)**

---

# 🥇 Layer 7: Real Domain + TLS (VLESS/Trojan)

> **Best overall (hardest to filter, very secure)**
> Real TLS tunnels that look like normal HTTPS websites (port 443)

[← Back to main guide](../README.md)

---

## ✅ Why this is the best

This method wraps your traffic in **real TLS with a real domain**, making it indistinguishable from normal HTTPS browsing.

**Key traits:**
- Real domain
- Valid TLS certificate
- Normal TLS fingerprint
- No obvious proxy signatures

---

## 🥇 TOP Setup (Ranked #1)

**VLESS / Trojan over REAL TLS (port 443)**

Why it wins:
- Looks exactly like a normal HTTPS site
- Uses real certificates (Let's Encrypt / Cloudflare)
- Passes DPI, SNI filtering, active probing, and traffic fingerprinting

**Security:** ⭐⭐⭐⭐⭐
**Stealth:** ⭐⭐⭐⭐⭐
**Speed:** ⭐⭐⭐⭐☆

---

## ⚠️ Important Truth (1 line)

You cannot create a free domain anonymously via CMD only.
DNS ownership always requires at least 1 manual step.

After that step → 100% automation.

---

## ✅ What is actually possible (free + real)

### 🥇 DuckDNS (FREE subdomain) — best option

One-time browser login, then everything is CLI/script forever:

1. Go to https://duckdns.org
2. Login (GitHub / Google)
3. Choose a name, e.g. `myproxy123.duckdns.org`
4. Copy your TOKEN

---

## ✅ Step 1 — One-time manual step

If you already own a domain, point it to your VPS IP.
If not, use DuckDNS.

![DuckDNS signup](./images/2.png)
*DuckDNS sign-up (replace later)*

---

## ✅ Step 2 — CMD / Shell DNS update

**Linux / macOS:**
```bash
curl "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip="
```

**Windows CMD / PowerShell:**
```powershell
curl "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip="
```

**PowerShell (cleaner):**
```powershell
Invoke-WebRequest "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip=" -UseBasicParsing
```

![DNS update](./images/3.png)
*DNS update example (replace later)*

---

## ✅ Step 3 — Get FREE TLS cert (required)

```bash
sudo certbot certonly --standalone \
  -d myproxy123.duckdns.org \
  --non-interactive \
  --agree-tos \
  -m admin@example.com
```

![TLS issued](./images/4.png)
*TLS issuance (replace later)*

---

## ✅ Step 4 — Install VLESS with REAL TLS

```bash
cd ssh-socks-proxy/layer7-real-domain
bash install.sh
```

The script will:
- obtain a valid TLS certificate
- configure VLESS on port 443
- output all connection details

![Installation](./images/5.png)
*Install screenshot (replace later)*

---

## 🔁 Optional — Auto-update DNS (cron)

```bash
*/5 * * * * curl -fs "https://www.duckdns.org/update?domains=myproxy123&token=YOUR_TOKEN&ip=" >/dev/null
```

---

## 🧩 Client config (VLESS example)

```json
{
  "outbounds": [{
    "protocol": "vless",
    "settings": {
      "vnext": [{
        "address": "myproxy123.duckdns.org",
        "port": 443,
        "users": [{"id": "YOUR_UUID", "encryption": "none"}]
      }]
    },
    "streamSettings": {
      "network": "ws",
      "security": "tls",
      "tlsSettings": {"serverName": "myproxy123.duckdns.org", "allowInsecure": false},
      "wsSettings": {"path": "/YOUR_PATH"}
    }
  }]
}
```

---

## 🏆 Final Verdict

| Question | Answer |
|----------|--------|
| Fully free? | ✅ YES |
| Pure CMD only, zero browser? | ❌ NO (impossible) |
| After 1 login, full automation? | ✅ YES |
| Usable for proxy + TLS? | ✅ YES |
| Hard to block? | ✅ VERY |

---

**Made with ❤️ for internet freedom**
