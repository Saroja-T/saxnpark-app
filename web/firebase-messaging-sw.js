importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-app.js");
importScripts("https://www.gstatic.com/firebasejs/8.10.0/firebase-messaging.js");


const firebaseConfig = {
    apiKey: "AIzaSyDquz7c4gJzzrUKSCX9lQg9fL0RIrcbDRI",
    authDomain: "parking-app-401207.firebaseapp.com",
    projectId: "parking-app-401207",
    storageBucket: "parking-app-401207.appspot.com",
    messagingSenderId: "392595934972",
    appId: "1:392595934972:web:b5b2a2cf812cd11296d179",
    measurementId: "G-WJVD4P506W"
  };
  
firebase.initializeApp(firebaseConfig);

const messaging = firebase.messaging();

// Optional:
messaging.onBackgroundMessage((message) => {
  console.log("onBackgroundMessage", message);
});