// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
    apiKey: 'AIzaSyBnQMMysQSEDx6F9QxRs5wzkTB1RBAzfRY',
    appId: '1:749584412975:web:7cb8527ffa0bab641af1da',
    messagingSenderId: '749584412975',
    projectId: 'mycafe-loli',
    authDomain: 'mycafe-loli.firebaseapp.com',
    storageBucket: 'mycafe-loli.appspot.com',
    measurementId: 'G-16LMMYRNEH',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCIQRHqP3hKmdRMoHVHndfks2lj_PwMMAg',
    appId: '1:749584412975:android:51a098a26f21e2b21af1da',
    messagingSenderId: '749584412975',
    projectId: 'mycafe-loli',
    storageBucket: 'mycafe-loli.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYa-G4Lx8zPxR4kLUCgNysLLiLvWEP3OQ',
    appId: '1:749584412975:ios:74353ac0d579ac5b1af1da',
    messagingSenderId: '749584412975',
    projectId: 'mycafe-loli',
    storageBucket: 'mycafe-loli.appspot.com',
    iosBundleId: 'com.example.coffeeShop',
  );
}
