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
    apiKey: 'AIzaSyDqi9aNuhAE9ppshBtiYI1htbF-nk3FWrU',
    appId: '1:522159891901:web:363f0c946270adc0dc1ed4',
    messagingSenderId: '522159891901',
    projectId: 'taskvine',
    authDomain: 'taskvine.firebaseapp.com',
    storageBucket: 'taskvine.appspot.com',
    measurementId: 'G-XEBBPS9LDJ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLw1DoaCzlmGrNi-CCOIs9415zhkxCeyQ',
    appId: '1:522159891901:android:8e8082d0745bd7aedc1ed4',
    messagingSenderId: '522159891901',
    projectId: 'taskvine',
    storageBucket: 'taskvine.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDRplr6uMY4SAYsKW5XacLANdiJOYAqSVo',
    appId: '1:522159891901:ios:e444f7e95360a3ebdc1ed4',
    messagingSenderId: '522159891901',
    projectId: 'taskvine',
    storageBucket: 'taskvine.appspot.com',
    iosBundleId: 'com.taskvine.taskvine',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDRplr6uMY4SAYsKW5XacLANdiJOYAqSVo',
    appId: '1:522159891901:ios:e444f7e95360a3ebdc1ed4',
    messagingSenderId: '522159891901',
    projectId: 'taskvine',
    storageBucket: 'taskvine.appspot.com',
    iosBundleId: 'com.taskvine.taskvine',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDqi9aNuhAE9ppshBtiYI1htbF-nk3FWrU',
    appId: '1:522159891901:web:a0106e0192960962dc1ed4',
    messagingSenderId: '522159891901',
    projectId: 'taskvine',
    authDomain: 'taskvine.firebaseapp.com',
    storageBucket: 'taskvine.appspot.com',
    measurementId: 'G-WM1SWRBSMS',
  );
}
