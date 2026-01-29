# راهنمای اتصال با Android - لایه ۷ (دامنه واقعی + TLS)

[← بازگشت به راهنمای اصلی لایه ۷](./README.md)

---

## اپلیکیشن مورد نیاز

**NetMod (Net Mod Syna)**

---

## مرحله ۱: نصب اپلیکیشن

از **Google Play** جستجو کنید: **NetMod** یا **Net Mod Syna**

---

## مرحله ۲: دریافت کانفیگ JSON

روی سرور، دستور اضافه کردن کاربر را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/add-user.sh -o add-user.sh && bash add-user.sh
```

بعد از اجرا، یک **کانفیگ JSON** و یک **لینک VLESS** دریافت می‌کنید. این اطلاعات را کپی کنید.

---

## مرحله ۳: اضافه کردن کانفیگ در NetMod

1. اپلیکیشن **NetMod** را باز کنید
2. روی **Profile** کلیک کنید
3. روی **Add new Profile** کلیک کنید
4. نوع اتصال **V2Ray VLESS** را انتخاب کنید
5. اطلاعات JSON را وارد کنید:
   - Address: **دامنه شما** (مثلاً myproxy123.duckdns.org)
   - Port: **443**
   - UUID: **UUID دریافت شده از سرور**
   - Encryption: **none**
   - Network: **ws** (WebSocket)
   - Path: **مسیر دریافت شده از سرور**
   - TLS: **فعال (Enable)**
   - SNI: **دامنه شما**
6. روی **Add** یا **Save** کلیک کنید

---

## مرحله ۴: اتصال

پروفایل جدید را انتخاب کنید و **Connect** بزنید.

---

## نکات مهم

- فیلد **inbounds** در JSON نباید خالی باشد. بدون آن، NetMod کانفیگ را قبول نمی‌کند
- این روش از گواهی TLS معتبر (Let's Encrypt) استفاده می‌کند
- ترافیک شما دقیقاً شبیه یک وبسایت HTTPS معمولی است
- UUID و کانفیگ را ایمن نگه دارید
- اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ برگردانده می‌شود

---

=====================================================================

# Android Connection Guide - Layer 7 (Real Domain + TLS)

[← Back to Layer 7 Main Guide](./README.md)

---

## Required App

**NetMod (Net Mod Syna)**

---

## Step 1: Install App

Search on **Google Play**: **NetMod** or **Net Mod Syna**

---

## Step 2: Get JSON Config

On the server, run the add user command:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-real-domain/add-user.sh -o add-user.sh && bash add-user.sh
```

After running, you will receive a **JSON config** and a **VLESS link**. Copy this information.

---

## Step 3: Add Config in NetMod

1. Open **NetMod** app
2. Click on **Profile**
3. Click on **Add new Profile**
4. Select connection type **V2Ray VLESS**
5. Enter the JSON information:
   - Address: **Your domain** (e.g., myproxy123.duckdns.org)
   - Port: **443**
   - UUID: **UUID received from server**
   - Encryption: **none**
   - Network: **ws** (WebSocket)
   - Path: **Path received from server**
   - TLS: **Enable**
   - SNI: **Your domain**
6. Click **Add** or **Save**

---

## Step 4: Connect

Select the new profile and tap **Connect**.

---

## Important Notes

- The **inbounds** field in the JSON must not be empty. Without it, NetMod will not accept the config
- This method uses a valid TLS certificate (Let's Encrypt)
- Your traffic looks exactly like a normal HTTPS website
- Keep UUID and config secure
- If you add the same username again, the same config will be returned

---

**Made with love for internet freedom**
