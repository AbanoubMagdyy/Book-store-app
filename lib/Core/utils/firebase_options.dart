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
    apiKey: 'AIzaSyB7oKF9e5A9KOTlhq-_z6nHK_mTJlXam9U',
    appId: '1:809354064201:web:3f4fe22335e84e99556a98',
    messagingSenderId: '809354064201',
    projectId: 'book-store-e7207',
    authDomain: 'book-store-e7207.firebaseapp.com',
    storageBucket: 'book-store-e7207.firebasestorage.app',
    measurementId: 'G-N7KV17Q6B1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAV-AgaPTa8OHTbl-uYh80Ft8jvTHEM55I',
    appId: '1:809354064201:android:e0e17d3a2b6c3baf556a98',
    messagingSenderId: '809354064201',
    projectId: 'book-store-e7207',
    storageBucket: 'book-store-e7207.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB7u4LxYNpkn-8lrZbz1nmFvMm5fPUzzmQ',
    appId: '1:809354064201:ios:fb13b22367f17592556a98',
    messagingSenderId: '809354064201',
    projectId: 'book-store-e7207',
    storageBucket: 'book-store-e7207.firebasestorage.app',
    iosBundleId: 'com.example.bookStore',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB7u4LxYNpkn-8lrZbz1nmFvMm5fPUzzmQ',
    appId: '1:809354064201:ios:fb13b22367f17592556a98',
    messagingSenderId: '809354064201',
    projectId: 'book-store-e7207',
    storageBucket: 'book-store-e7207.firebasestorage.app',
    iosBundleId: 'com.example.bookStore',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyB7oKF9e5A9KOTlhq-_z6nHK_mTJlXam9U',
    appId: '1:809354064201:web:90e3e930e81ac1bd556a98',
    messagingSenderId: '809354064201',
    projectId: 'book-store-e7207',
    authDomain: 'book-store-e7207.firebaseapp.com',
    storageBucket: 'book-store-e7207.firebasestorage.app',
    measurementId: 'G-1DCELCXXGX',
  );

}