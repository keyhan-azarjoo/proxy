# راهنمای دریافت دامنه رایگان از DuckDNS

[← بازگشت به راهنمای اصلی](./README.md)

---

## چرا DuckDNS؟

DuckDNS یک سرویس **DNS داینامیک رایگان** است که:
- کاملاً رایگان است
- نیازی به کارت اعتباری ندارد
- راه‌اندازی ساده دارد
- تا ۵ زیردامنه می‌توانید بسازید
- با حساب Google یا GitHub لاگین می‌کنید

**نتیجه:** یک دامنه مثل `myproxy.duckdns.org` دریافت می‌کنید که به IP سرور شما اشاره می‌کند.

---

--------------------------------------------------
مرحله ۱: ورود به DuckDNS
--------------------------------------------------

وارد سایت شوید:
https://duckdns.org

با **Google** یا **GitHub** لاگین کنید.
<img width="1918" height="1136" alt="Screenshot 2026-01-29 085553" src="https://github.com/user-attachments/assets/57684565-3981-44a4-89d0-abd2b8cf8c78" />

بعد از لاگین، یک صفحه reCaptcha نمایش داده می‌شود. آن را تکمیل کنید:

<img width="1662" height="1081" alt="2" src="https://github.com/user-attachments/assets/d0d85295-1508-41fd-b5ef-4cd0d82bfdd5" />


---

--------------------------------------------------
مرحله ۲: مشاهده داشبورد و TOKEN
--------------------------------------------------

بعد از ورود، داشبورد DuckDNS نمایش داده می‌شود.

در این صفحه اطلاعات مهمی می‌بینید:
- **account:** ایمیل شما
- **type:** free
- **token:** یک کد منحصر به فرد (این را کپی و نگه دارید!)

در قسمت **domains** می‌توانید زیردامنه جدید بسازید.

<img width="1660" height="1082" alt="3" src="https://github.com/user-attachments/assets/958d326c-0e27-4e5a-b8c0-85ab4f381da1" />

**TOKEN خود را حتماً کپی کنید.** در مراحل بعدی به آن نیاز دارید.

---

--------------------------------------------------
مرحله ۳: ساخت زیردامنه
--------------------------------------------------

۱. در کادر کنار `http://` یک نام دلخواه تایپ کنید (مثلاً: `myproxy`)

۲. روی دکمه **add domain** کلیک کنید

۳. پیام سبز **"success: domain ... added to your account"** نمایش داده می‌شود

<img width="1658" height="1082" alt="4" src="https://github.com/user-attachments/assets/cfe83b4c-7f5c-49a2-978e-e4d498aceaf2" />

حالا دامنه شما ساخته شد! (مثلاً: `myproxy.duckdns.org`)

---

--------------------------------------------------
مرحله ۴: وارد کردن IP سرور
--------------------------------------------------

۱. IP سرور خود را (از پنل IONOS یا هر ارائه‌دهنده دیگر) در کادر **current ip** وارد کنید

۲. روی دکمه **update ip** کلیک کنید

۳. پیام سبز **"success: ip address for ... updated to ..."** نمایش داده می‌شود

<img width="1657" height="1087" alt="5" src="https://github.com/user-attachments/assets/86821fa9-a858-4e36-8c32-acd458365f37" />

**تمام شد!** دامنه شما اکنون به IP سرورتان اشاره می‌کند.

---

## اطلاعاتی که باید نگه دارید

| اطلاعات | مثال |
|---------|-------|
| دامنه | `myproxy.duckdns.org` |
| TOKEN | `b594257d-fc17-443c-af04-adbfaf6ba644` |
| IP سرور | `87.106.68.203` |

**این اطلاعات را در جای امنی ذخیره کنید.**

---

## مرحله بعد

اکنون که دامنه رایگان دارید، به راهنمای لایه ۷ برگردید و از **مرحله ۳ (اتصال SSH)** ادامه دهید:

- [← راهنمای لایه ۷: دامنه واقعی + TLS](./layer7-real-domain/README.md)

یا اگر هنوز سرور نخریدید:

- [راهنمای خرید سرور از IONOS](./buy-ionos-server.md)

---

=====================================================================

# Guide to Getting a Free Domain from DuckDNS

[← Back to main guide](./README.md)

---

## Why DuckDNS?

DuckDNS is a **free dynamic DNS** service that:
- Is completely free
- No credit card required
- Simple to set up
- You can create up to 5 subdomains
- Login with Google or GitHub account

**Result:** You get a domain like `myproxy.duckdns.org` that points to your server IP.

---

--------------------------------------------------
Step 1: Login to DuckDNS
--------------------------------------------------

Go to:
https://duckdns.org

Login with **Google** or **GitHub**.

<img width="1918" height="1136" alt="Screenshot 2026-01-29 085553" src="https://github.com/user-attachments/assets/57684565-3981-44a4-89d0-abd2b8cf8c78" />

After login, a reCaptcha page will be displayed. Complete it:

<img width="1662" height="1081" alt="2" src="https://github.com/user-attachments/assets/d0d85295-1508-41fd-b5ef-4cd0d82bfdd5" />

---

--------------------------------------------------
Step 2: View Dashboard and TOKEN
--------------------------------------------------

After login, the DuckDNS dashboard is displayed.

On this page you will see important information:
- **account:** your email
- **type:** free
- **token:** a unique code (copy and keep this!)

In the **domains** section you can create a new subdomain.

<img width="1660" height="1082" alt="3" src="https://github.com/user-attachments/assets/958d326c-0e27-4e5a-b8c0-85ab4f381da1" />

**Make sure to copy your TOKEN.** You will need it in the next steps.

---

--------------------------------------------------
Step 3: Create a Subdomain
--------------------------------------------------

1. In the box next to `http://` type a name of your choice (e.g.: `myproxy`)

2. Click the **add domain** button

3. A green message **"success: domain ... added to your account"** will appear

<img width="1658" height="1082" alt="4" src="https://github.com/user-attachments/assets/cfe83b4c-7f5c-49a2-978e-e4d498aceaf2" />

Your domain is now created! (e.g.: `myproxy.duckdns.org`)

---

--------------------------------------------------
Step 4: Enter Server IP
--------------------------------------------------

1. Enter your server IP (from IONOS panel or any other provider) in the **current ip** box

2. Click the **update ip** button

3. A green message **"success: ip address for ... updated to ..."** will appear

<img width="1657" height="1087" alt="5" src="https://github.com/user-attachments/assets/86821fa9-a858-4e36-8c32-acd458365f37" />

**Done!** Your domain now points to your server IP.

---

## Information to Keep

| Information | Example |
|-------------|---------|
| Domain | `myproxy.duckdns.org` |
| TOKEN | `b594257d-fc17-443c-af04-adbfaf6ba644` |
| Server IP | `87.106.68.203` |

**Save this information in a safe place.**

---

## Next Step

Now that you have a free domain, go back to the Layer 7 guide and continue from **Step 3 (SSH Connection)**:

- [← Layer 7 Guide: Real Domain + TLS](./layer7-real-domain/README.md)

Or if you haven't purchased a server yet:

- [Guide to Purchasing Server from IONOS](./buy-ionos-server.md)

---

**Made with love for internet freedom**
