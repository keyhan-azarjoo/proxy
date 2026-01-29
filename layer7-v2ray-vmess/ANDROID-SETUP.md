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

<img width="597" height="1251" alt="Screenshot 2026-01-29 at 02 30 51" src="https://github.com/user-attachments/assets/2ba70fc3-c3d2-4d05-bab7-6957fba209bc" />

بعد از اجرا، یک **کانفیگ JSON** و یک **لینک VMess** دریافت می‌کنید. این اطلاعات را کپی کنید.

---

## مرحله ۳: اضافه کردن کانفیگ در NetMod

1. اپلیکیشن **NetMod** را باز کنید
2
click on add
![photo_6039706939081559660_y](https://github.com/user-attachments/assets/ac324b74-daec-4182-85b1-ea746e8c4401)
then click on json config

![photo_6039706939081559662_y](https://github.com/user-attachments/assets/b9874cfd-8168-4fa9-91ee-b39b1d593316)

then click on open Editor
![photo_6039706939081559663_y](https://github.com/user-attachments/assets/9fb5852d-6007-4762-9d52-9fbf9cac801c)

then paste the json in the editor and click the checkbox and save it
![photo_6039706939081559661_y](https://github.com/user-attachments/assets/f17d62bc-ded1-40c7-b214-50913316ae48)

then click on the newly saved config and connect
![photo_6039706939081559664_y](https://github.com/user-attachments/assets/7640d0dd-d860-4a61-85ba-a9c602281b84)


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
