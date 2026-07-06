# 🛍️ متجرنا الإلكتروني - Firebase Shop

## 📋 نظرة عامة
متجر إلكتروني كامل مربوط بـ Firebase مع لوحة تحكم وإشعارات فورية.

---

## 🚀 الخطوات المطلوبة للتشغيل

### 1. تفعيل خدمات Firebase

روح على [Firebase Console](https://console.firebase.google.com/project/my-store-bf8a3)

#### A. تفعيل Realtime Database
1. من القائمة الجانبية: **Build** → **Realtime Database**
2. اضغط **Create Database**
3. اختار **Start in test mode** (للتجربة)
4. اضغط **Enable**

#### B. تفعيل Storage
1. من القائمة الجانبية: **Build** → **Storage**
2. اضغط **Get started**
3. اختار **Start in test mode**
4. اضغط **Next** → **Done**

#### C. تفعيل Cloud Messaging (للإشعارات)
1. من القائمة الجانبية: **Build** → **Cloud Messaging**
2. اضغط **First, add Firebase to your web app**
3. اضغط **Generate key pair** تحت **Web Push certificates**
4. خد الـ **Key pair** وحطه في `js/notifications.js` بدل `YOUR_VAPID_KEY_HERE`

---

## 📁 هيكل الملفات

```
shop-firebase/
├── index.html              ← واجهة العميل
├── manifest.json           ← PWA manifest
├── firebase-messaging-sw.js ← Service Worker للإشعارات
├── css/
│   └── style.css           ← تنسيق واجهة العميل
├── js/
│   ├── firebase-config.js  ← إعدادات Firebase
│   ├── main.js             ← منطق واجهة العميل
│   └── notifications.js    ← نظام الإشعارات
└── admin/
    ├── index.html          ← لوحة التحكم
    ├── admin.css           ← تنسيق لوحة التحكم
    └── admin.js            ← منطق لوحة التحكم
```

---

## 🔐 رقم المرور

رقم مرور لوحة التحكم الافتراضي: **123456**

---

## 🔔 نظام الإشعارات

### كيف يشتغل:
1. العميل يضيف منتج للسلة ويطلب
2. الطلب يتسجل في Firebase
3. لوحة التحكم تستقبل إشعار فوري:
   - 🔊 صوت تنبيه
   - 🔔 إشعار منبثق على الشاشة
   - 📱 إشعار متصفح (لو فعلت الإذن)

### تفعيل الإشعارات:
1. افتح لوحة التحكم
2. اضغط على زر **تفعيل الإشعارات**
3. سمح للمتصفح بإرسال الإشعارات

---

## 📱 PWA (تطبيق ويب تقدمي)

الموقع يشتغل كتطبيق على الموبايل:
- يتثبت على الشاشة الرئيسية
- يشتغل offline
- إشعارات push

---

## 🎨 المميزات

### واجهة العميل:
- ✅ شاشة افتتاحية بأنيميشن
- ✅ سلايدر صور متحرك
- ✅ أقسام قابلة للتخصيص
- ✅ شبكة منتجات مع ألوان ومقاسات
- ✅ صفحة تفاصيل المنتج مع معرض صور
- ✅ سلة مشتريات + مفضلة
- ✅ طلب سريع (اسم + تليفون + عنوان)
- ✅ روابط سوشيال ميديا

### لوحة التحكم:
- ✅ تسجيل دخول محمي
- ✅ تغيير اسم المحل واللوجو
- ✅ رفع صور العرض
- ✅ إدارة الأقسام
- ✅ إضافة/تعديل/حذف منتجات
- ✅ رفع صور متعددة للمنتج
- ✅ ألوان ومقاسات بتوفرها
- ✅ تفعيل/تعطيل المنتجات
- ✅ إدارة الطلبات مع حالاتها
- ✅ إشعارات فورية للطلبات الجديدة
- ✅ عداد طلبات معلقة في الشريط الجانبي

---

## ⚠️ ملاحظات أمان مهمة

### للإنتاج (Production):
1. **غير رقم المرور** في `admin/admin.js`
2. **حدث قواعد Firebase**:
```json
{
  "rules": {
    "settings": {
      ".read": true,
      ".write": false
    },
    "products": {
      ".read": true,
      ".write": false
    },
    "orders": {
      ".read": false,
      ".write": true
    }
  }
}
```
3. **أضف Firebase Auth** للأدمن
4. **استخدم HTTPS** دائماً

---

## 🚀 النشر

### على Firebase Hosting (مجاني):
```bash
npm install -g firebase-tools
firebase login
firebase init hosting
firebase deploy
```

### على Netlify (مجاني):
1. ارفع الملفات على GitHub
2. ربط GitHub بـ Netlify
3. اختار المستودع
4. اضغط Deploy

---

## 📞 للمساعدة

لو واجهتك أي مشكلة، تأكد من:
1. ✅ تفعيل جميع خدمات Firebase المذكورة
2. ✅ صحة إعدادات Firebase في `firebase-config.js`
3. ✅ فتح الموقع على HTTPS (للإشعارات)
4. ✅ السماح للمتصفح بإرسال الإشعارات

---

**تم البناء بواسطة Kimi AI** 🤖
