# راهنمای اتصال با iOS - لایه ۷ (V2Ray VMess)

[← بازگشت به راهنمای اصلی لایه ۷](./README.md)

---

## اپلیکیشن مورد نیاز

**NPV Tunnel**

---

## مرحله ۱: نصب اپلیکیشن

وارد **App Store** شوید و جستجو کنید: **NPV Tunnel**

---

## مرحله ۲: دریافت کانفیگ JSON

روی سرور، دستور اضافه کردن کاربر را اجرا کنید:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```
<img width="597" height="1251" alt="Screenshot 2026-01-29 at 02 30 51" src="https://github.com/user-attachments/assets/72e160d2-a380-4f5e-befb-9a7e8e071b7c" />

بعد از اجرا، یک **کانفیگ JSON** و یک **لینک VMess** دریافت می‌کنید. این اطلاعات را کپی کنید.

---

## مرحله ۳: اضافه کردن کانفیگ در NPV Tunnel

1. اپلیکیشن **NPV Tunnel** را باز کنید
2. go to the config page
![photo_6039706939081559670_y](https://github.com/user-attachments/assets/60c584db-692c-4dfc-9397-51937e95c5c3)
then click on +
![photo_6039706939081559669_y](https://github.com/user-attachments/assets/5bcc2142-acfd-440b-bf4b-4f0111b1affd)

then select add config manually
![photo_6039706939081559668_y](https://github.com/user-attachments/assets/8cff8eeb-7ecb-4d64-b57d-943b11aff82a)
then select V2ray Config 

![photo_6039706939081559667_y](https://github.com/user-attachments/assets/f6cb1e96-ac04-4353-8cbb-fb653bc77194)

then paste the ios json here and click on save

![photo_6039706939081559666_y](https://github.com/user-attachments/assets/8e2d3f37-84b8-4f9e-bf2b-63e3f63b8bac)

then from the list, select the saved config and connect
![photo_6039706939081559665_y](https://github.com/user-attachments/assets/e8f8dc31-def6-4efc-9259-bee71bd73a81)




8. روی **Save** کلیک کنید

---

## مرحله ۴: اتصال

روی کانفیگ ذخیره شده کلیک کنید و **Connect** بزنید.

---

Android
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



## نکات مهم

- UUID و کانفیگ را ایمن نگه دارید
- اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ برگردانده می‌شود
- برای هر کاربر یک UUID جداگانه ساخته می‌شود

---

=====================================================================

# iOS Connection Guide - Layer 7 (V2Ray VMess)

[← Back to Layer 7 Main Guide](./README.md)

---

## Required App

**NPV Tunnel**

---

## Step 1: Install App

Go to **App Store** and search: **NPV Tunnel**

---

## Step 2: Get JSON Config

On the server, run the add user command:

```bash
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vmess/add-user.sh -o add-user.sh && bash add-user.sh
```

After running, you will receive a **JSON config** and a **VMess link**. Copy this information.

---

## Step 3: Add Config in NPV Tunnel

1. Open **NPV Tunnel** app
2. Go to **Config** section
3. Click **+**
4. Select **Add Config Manually**
5. Select **V2Ray VMess**
6. Enter the JSON information:
   - Address: **Your server IP**
   - Port: **443**
   - UUID: **UUID received from server**
   - AlterID: **0**
   - Security: **auto**
   - Network: **tcp**
   - TLS: **Enable**
   - Allow Insecure: **Enable**
7. Click **Save**

---

## Step 4: Connect

Tap on the saved config and tap **Connect**.

---

## Important Notes

- Keep UUID and config secure
- If you add the same username again, the same config will be returned
- A separate UUID is created for each user

---

**Made with love for internet freedom**
