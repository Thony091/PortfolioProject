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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyA1ZccNAzEywmgRIv3kCXUMhKDc6vwGeXM',
    appId: '1:217586613826:web:d0ee26529a0e45c9a2f7db',
    messagingSenderId: '217586613826',
    projectId: 'portfolioproject-57fd8',
    authDomain: 'portfolioproject-57fd8.firebaseapp.com',
    storageBucket: 'portfolioproject-57fd8.appspot.com',
    measurementId: 'G-WDR59DR8QT',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDNGeQe9A6jVghrch1jjkSx59has53BHcc',
    appId: '1:217586613826:android:75f9d653aa749cd8a2f7db',
    messagingSenderId: '217586613826',
    projectId: 'portfolioproject-57fd8',
    storageBucket: 'portfolioproject-57fd8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD_9Fdrs0dl1-XVqoDZW_Qc6NghXTydkx8',
    appId: '1:217586613826:ios:7852a2a857f88500a2f7db',
    messagingSenderId: '217586613826',
    projectId: 'portfolioproject-57fd8',
    storageBucket: 'portfolioproject-57fd8.appspot.com',
    iosBundleId: 'com.duoc.portfolioProject',
  );
}
