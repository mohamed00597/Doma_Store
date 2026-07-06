# 🚀 دليل النشر على Firebase Hosting

## الخطوات:

### 1. حمل وثبت Node.js
من هنا: https://nodejs.org (اختر LTS)

### 2. ثبت Firebase CLI
افتح Terminal أو Command Prompt واكتب:
```bash
npm install -g firebase-tools
```

### 3. سجل دخول لـ Firebase
```bash
firebase login
```
هيفتح لك صفحة في المتصفح، سجل دخول بحساب Google

### 4. روح لمجلد المشروع
```bash
cd shop-firebase
```

### 5. انسخ الملفات لمجلد public
```bash
# Windows:
mkdir public
copy index.html publicxcopy /E /I /Y css public\cssxcopy /E /I /Y js public\jsxcopy /E /I /Y admin publicdmincopy manifest.json publiccopy firebase-messaging-sw.js public
# Mac/Linux:
mkdir -p public
cp index.html public/
cp -r css public/
cp -r js public/
cp -r admin public/
cp manifest.json public/
cp firebase-messaging-sw.js public/
```

### 6. انشر الموقع!
```bash
firebase deploy --only hosting
```

### 7. 🎉 خلاص!
الموقع هيكون شغال على:
- **https://my-store-bf8a3.web.app** (Main)
- **https://my-store-bf8a3.firebaseapp.com** (Alternative)

---

## 🔥 أو استخدم الملفات الجاهزة:

### على Windows:
اضغط مرتين على **deploy.bat**

### على Mac/Linux:
```bash
chmod +x deploy.sh
./deploy.sh
```

---

## 📋 ملاحظات مهمة:

1. **تأكد إن Firebase Hosting مفعل** في مشروعك:
   - روح https://console.firebase.google.com/project/my-store-bf8a3/hosting
   - اضغط "Get started"

2. **Database Rules** لازم تكون:
   ```json
   {
     "rules": {
       ".read": true,
       ".write": true
     }
   }
   ```

3. **Storage Rules** لازم تكون:
   ```
   rules_version = '2';
   service firebase.storage {
     match /b/{bucket}/o {
       match /{allPaths=**} {
         allow read, write;
       }
     }
   }
   ```

---

## 🔄 تحديث الموقع بعد التعديل:

لو عدّلت أي حاجة وعايز تنشر التحديث:
```bash
firebase deploy --only hosting
```

أو ببساطة شغّل **deploy.bat** أو **deploy.sh** تاني!
