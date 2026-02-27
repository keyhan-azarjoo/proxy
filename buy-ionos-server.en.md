# Guide to Purchasing VPS Server from IONOS

[← Back to main guide](./README.en.md)

---

## Why IONOS?

IONOS is one of the reputable VPS providers in Europe that:
- Has reasonable pricing
- Provides stable servers
- Has a simple user panel

**Note:** You can use any other VPS provider, as long as the operating system is Ubuntu.

---

--------------------------------------------------
Step 1: Purchase VPS Server
--------------------------------------------------

Purchase link:
https://www.ionos.co.uk/servers/vps

![VPS Selection](https://github.com/user-attachments/assets/76de78dc-0a84-47ae-9a58-b3665330b168)

### When purchasing, pay attention to these points:
- Operating system must be **Ubuntu**
- Even a cheap plan is completely sufficient
- Server location depends on your needs

![VPS Selection](https://github.com/user-attachments/assets/823cb7b2-8a84-40fd-9caa-d85563ede9ee)

---

--------------------------------------------------
Step 2: Access IONOS Panel
--------------------------------------------------

After purchase, log in to the IONOS user panel:

https://my.ionos.co.uk/home/products
Or directly:
https://my.ionos.co.uk/server

<img width="1182" height="1388" alt="IONOS Panel" src="https://github.com/user-attachments/assets/46a45e79-c30c-44ca-b8cb-3508616e72f7" />

---

--------------------------------------------------
Step 3: Get Server Information
--------------------------------------------------

On the server page, you will see very important information:

- **Server IP** (very important)
- **Username:** root
- **Initial password**

<img width="1182" height="1387" alt="Server Info" src="https://github.com/user-attachments/assets/8cf364c3-a090-4f20-b496-ab45ed2f3659" />

**Keep this information safe.** You will need it in the next steps.

---

## To change the IP address of ypour server for free
in your panel in side bar, click on Network -> public IP
then click on create
<img width="1918" height="1132" alt="1" src="https://github.com/user-attachments/assets/85b7cecb-7d75-47a8-872a-32edb35b7a9d" />

then select your server and click on create
it show you need to pay 5 pound to get a new IP but it efect if you have the second IP for more than 3 day
so if you create the ip and delet ethe previous IP, you do not need to pay any money for IP
<img width="1918" height="1132" alt="2" src="https://github.com/user-attachments/assets/aab669b2-5f44-40fc-84a0-5277b3906233" />
<img width="1910" height="1132" alt="3" src="https://github.com/user-attachments/assets/c010ec53-8cd7-47ce-8059-677a721c13d5" />

after that, in your ip list, select the old IP and delete it(do it when the second IP has been created)
<img width="1917" height="1141" alt="4" src="https://github.com/user-attachments/assets/5406de4c-c8d7-469e-9385-6e278539700b" />

then go to server page and restart the server

<img width="1915" height="1133" alt="5" src="https://github.com/user-attachments/assets/76901ad5-ff76-4988-a0d8-89117e5e39bd" />


now you can use your new IP


## To reinstall the os and start everything new from scratchj
you can go to Action -> reinstall image

<img width="1912" height="1123" alt="6" src="https://github.com/user-attachments/assets/ec3fec58-e90f-4216-909f-fc226aea3531" />

then select your OS and click on reinstall
<img width="1918" height="1138" alt="7" src="https://github.com/user-attachments/assets/317a6846-5717-45c9-a263-df22c524b80a" />

it reset everything and give you a fresh OS





## Next Step

Now that you have purchased the server and have its information, return to the main guide and continue from **Step 2 (SSH Connection)**:

- [← Back to main guide](./README.en.md)

Or go directly to your preferred installation method:
- [Layer 3: Basic SSH](./layer3-basic/README.en.md)
- [Layer 4: Nginx (Recommended)](./layer4-nginx/README.en.md)
- [Layer 6: Stunnel](./layer6-stunnel/README.en.md)
- [Layer 7: V2Ray VMess](./layer7-v2ray-vmess/README.en.md)
- [Layer 7: Real Domain](./layer7-real-domain/README.en.md)

---

**Made with love for internet freedom**

