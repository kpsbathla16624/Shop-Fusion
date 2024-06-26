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
    apiKey: 'AIzaSyBcV02PUPG5C4md_gXiBddbGRC11cAS1WQ',
    appId: '1:184360520945:web:b812bd47c646c44302ad50',
    messagingSenderId: '184360520945',
    projectId: 'shopfusion-kps',
    authDomain: 'shopfusion-kps.firebaseapp.com',
    storageBucket: 'shopfusion-kps.appspot.com',
    measurementId: 'G-MKJFMD6J7L',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDZsPzQbYYbQg4VbztwekQOw1LB3PC0Z5E',
    appId: '1:184360520945:android:9f409b88dd64979902ad50',
    messagingSenderId: '184360520945',
    projectId: 'shopfusion-kps',
    storageBucket: 'shopfusion-kps.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyApAsG8m8wB2I30hB-NZGEbF4FtL9WnSFw',
    appId: '1:184360520945:ios:7af1ad5300d3852502ad50',
    messagingSenderId: '184360520945',
    projectId: 'shopfusion-kps',
    storageBucket: 'shopfusion-kps.appspot.com',
    iosBundleId: 'com.example.shopfusion',
  );
}
