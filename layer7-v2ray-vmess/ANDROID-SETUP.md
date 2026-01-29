# راهنمای اتصال با Android - لایه ۷ (V2Ray VMess)

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
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

بعد از اجرا، یک **کانفیگ JSON** و یک **لینک VMess** دریافت می‌کنید. این اطلاعات را کپی کنید.

---

## مرحله ۳: اضافه کردن کانفیگ در NetMod

1. اپلیکیشن **NetMod** را باز کنید
2. روی **Profile** کلیک کنید
3. روی **Add new Profile** کلیک کنید
4. نوع اتصال **V2Ray VMess** را انتخاب کنید
5. اطلاعات JSON را وارد کنید:
   - Address: **IP سرور**
   - Port: **443**
   - UUID: **UUID دریافت شده از سرور**
   - AlterID: **0**
   - Security: **auto**
   - Network: **tcp**
   - TLS: **فعال (Enable)**
   - Allow Insecure: **فعال**
6. روی **Add** یا **Save** کلیک کنید

---

## مرحله ۴: اتصال

پروفایل جدید را انتخاب کنید و **Connect** بزنید.

---

## نکات مهم

- فیلد **inbounds** در JSON نباید خالی باشد. بدون آن، NetMod کانفیگ را قبول نمی‌کند
- UUID و کانفیگ را ایمن نگه دارید
- اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ برگردانده می‌شود
- برای هر کاربر یک UUID جداگانه ساخته می‌شود

---

=====================================================================

# Android Connection Guide - Layer 7 (V2Ray VMess)

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
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

After running, you will receive a **JSON config** and a **VMess link**. Copy this information.

---

## Step 3: Add Config in NetMod

1. Open **NetMod** app
2. Click on **Profile**
3. Click on **Add new Profile**
4. Select connection type **V2Ray VMess**
5. Enter the JSON information:
   - Address: **Your server IP**
   - Port: **443**
   - UUID: **UUID received from server**
   - AlterID: **0**
   - Security: **auto**
   - Network: **tcp**
   - TLS: **Enable**
   - Allow Insecure: **Enable**
6. Click **Add** or **Save**

---

## Step 4: Connect

Select the new profile and tap **Connect**.

---

## Important Notes

- The **inbounds** field in the JSON must not be empty. Without it, NetMod will not accept the config
- Keep UUID and config secure
- If you add the same username again, the same config will be returned
- A separate UUID is created for each user

---

**Made with love for internet freedom**
