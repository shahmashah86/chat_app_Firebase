// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDz8P35UjZCbtLFL89DgGZM7rJDP58uomk',
    appId: '1:141722026711:web:1d85215b76c754c21d6692',
    messagingSenderId: '141722026711',
    projectId: 'chat-app-54b94',
    authDomain: 'chat-app-54b94.firebaseapp.com',
    storageBucket: 'chat-app-54b94.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBXJhr6C5HHli9vlw9-lLi69cmHDL_X7uM',
    appId: '1:141722026711:android:940947df019d83691d6692',
    messagingSenderId: '141722026711',
    projectId: 'chat-app-54b94',
    storageBucket: 'chat-app-54b94.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbdSWMSR0mEHs6QfvzBecrLKYLuwynlO4',
    appId: '1:141722026711:ios:69630788638503061d6692',
    messagingSenderId: '141722026711',
    projectId: 'chat-app-54b94',
    storageBucket: 'chat-app-54b94.firebasestorage.app',
    iosBundleId: 'com.example.telegramClone',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbdSWMSR0mEHs6QfvzBecrLKYLuwynlO4',
    appId: '1:141722026711:ios:69630788638503061d6692',
    messagingSenderId: '141722026711',
    projectId: 'chat-app-54b94',
    storageBucket: 'chat-app-54b94.firebasestorage.app',
    iosBundleId: 'com.example.telegramClone',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDz8P35UjZCbtLFL89DgGZM7rJDP58uomk',
    appId: '1:141722026711:web:5c9442e3ddae92971d6692',
    messagingSenderId: '141722026711',
    projectId: 'chat-app-54b94',
    authDomain: 'chat-app-54b94.firebaseapp.com',
    storageBucket: 'chat-app-54b94.firebasestorage.app',
  );
}
