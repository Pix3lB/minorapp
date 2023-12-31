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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDcl3XetbmcJu6we6eui6ZOMOXawqAJzpg',
    appId: '1:1076995579369:web:0bfb1e05e806c2007c3f78',
    messagingSenderId: '1076995579369',
    projectId: 'pminor-8de3e',
    authDomain: 'pminor-8de3e.firebaseapp.com',
    storageBucket: 'pminor-8de3e.appspot.com',
    measurementId: 'G-9QHM5N9WDX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAjDTpv1880ziLXK2HY8VpmEp8SYCYUakc',
    appId: '1:1076995579369:android:d036901cc285f91b7c3f78',
    messagingSenderId: '1076995579369',
    projectId: 'pminor-8de3e',
    storageBucket: 'pminor-8de3e.appspot.com',
  );
}
