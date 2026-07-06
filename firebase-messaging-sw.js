importScripts('https://www.gstatic.com/firebasejs/9.22.0/firebase-app-compat.js');
importScripts('https://www.gstatic.com/firebasejs/9.22.0/firebase-messaging-compat.js');

const firebaseConfig = {
    apiKey: "AIzaSyCo5LlBsxOsZ7K4RtQitI7fgpYymgG4r0s",
    authDomain: "my-store-bf8a3.firebaseapp.com",
    databaseURL: "https://my-store-bf8a3-default-rtdb.firebaseio.com",
    projectId: "my-store-bf8a3",
    storageBucket: "my-store-bf8a3.firebasestorage.app",
    messagingSenderId: "153177906323",
    appId: "1:153177906323:web:59f9f4840cc1bce5f40166",
    measurementId: "G-WF08RGDNPP"
};

firebase.initializeApp(firebaseConfig);
const messaging = firebase.messaging();

messaging.onBackgroundMessage((payload) => {
    console.log('[firebase-messaging-sw.js] Received background message ', payload);

    const notificationTitle = payload.notification.title;
    const notificationOptions = {
        body: payload.notification.body,
        icon: payload.notification.icon || '/icon-192x192.png',
        badge: '/badge-72x72.png',
        tag: payload.data?.orderId || 'new-order',
        requireInteraction: true,
        actions: [
            {
                action: 'view',
                title: 'عرض الطلب'
            },
            {
                action: 'dismiss',
                title: 'إغلاق'
            }
        ],
        data: payload.data
    };

    self.registration.showNotification(notificationTitle, notificationOptions);
});

self.addEventListener('notificationclick', (event) => {
    event.notification.close();

    const action = event.action;
    const orderId = event.notification.data?.orderId;

    if (action === 'view' || !action) {
        event.waitUntil(
            clients.matchAll({ type: 'window' }).then((clientList) => {
                const adminUrl = '/admin/index.html';

                for (const client of clientList) {
                    if (client.url.includes('admin') && 'focus' in client) {
                        return client.focus();
                    }
                }

                if (clients.openWindow) {
                    return clients.openWindow(adminUrl);
                }
            })
        );
    }
});
