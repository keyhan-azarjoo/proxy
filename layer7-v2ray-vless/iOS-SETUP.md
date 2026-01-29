# راهنمای اتصال با iOS - لایه ۷ (V2Ray VLESS)

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
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vless/add-user.sh -o add-user.sh && bash add-user.sh
```

بعد از اجرا، یک **کانفیگ JSON** و یک **لینک VLESS** دریافت می‌کنید. این اطلاعات را کپی کنید.

---

## مرحله ۳: اضافه کردن کانفیگ در NPV Tunnel

1. اپلیکیشن **NPV Tunnel** را باز کنید
2. به بخش **Config** بروید
3. روی **+** کلیک کنید
4. **Add Config Manually** را انتخاب کنید
5. **V2Ray VLESS** را انتخاب کنید
6. اطلاعات JSON را وارد کنید:
   - Address: **IP سرور**
   - Port: **443**
   - UUID: **UUID دریافت شده از سرور**
   - Encryption: **none**
   - Network: **ws** (WebSocket)
   - Path: **مسیر دریافت شده از سرور**
   - TLS: **فعال (Enable)**
   - Allow Insecure: **فعال**
7. روی **Save** کلیک کنید

---

## مرحله ۴: اتصال

روی کانفیگ ذخیره شده کلیک کنید و **Connect** بزنید.

---

## نکات مهم

- UUID و کانفیگ را ایمن نگه دارید
- اگر همان نام کاربری را دوباره اضافه کنید، همان کانفیگ برگردانده می‌شود
- چون گواهی self-signed است، Allow Insecure باید فعال باشد

---

=====================================================================

# iOS Connection Guide - Layer 7 (V2Ray VLESS)

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
curl -fsSL https://raw.githubusercontent.com/keyhan-azarjoo/proxy/main/layer7-v2ray-vless/add-user.sh -o add-user.sh && bash add-user.sh
```

After running, you will receive a **JSON config** and a **VLESS link**. Copy this information.

---

## Step 3: Add Config in NPV Tunnel

1. Open **NPV Tunnel** app
2. Go to **Config** section
3. Click **+**
4. Select **Add Config Manually**
5. Select **V2Ray VLESS**
6. Enter the JSON information:
   - Address: **Your server IP**
   - Port: **443**
   - UUID: **UUID received from server**
   - Encryption: **none**
   - Network: **ws** (WebSocket)
   - Path: **Path received from server**
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
- Since the certificate is self-signed, Allow Insecure must be enabled

---

**Made with love for internet freedom**
