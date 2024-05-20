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
    apiKey: 'AIzaSyD87ZoBmIWg0yjqfLk4prt6eiTwfAqtFZc',
    appId: '1:675855453422:web:18cda6bb4ea67c1c3537ff',
    messagingSenderId: '675855453422',
    projectId: 'pizza-app-b53fc',
    authDomain: 'pizza-app-b53fc.firebaseapp.com',
    storageBucket: 'pizza-app-b53fc.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA_YpmRN8pVB768RQdghRB3Fm6dU9IJQ3I',
    appId: '1:675855453422:android:6db1f5b97409d3b13537ff',
    messagingSenderId: '675855453422',
    projectId: 'pizza-app-b53fc',
    storageBucket: 'pizza-app-b53fc.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCVJZs7537jHeG-deOHljAzVPByyj0h2rs',
    appId: '1:675855453422:ios:79ebcbc32330a8023537ff',
    messagingSenderId: '675855453422',
    projectId: 'pizza-app-b53fc',
    storageBucket: 'pizza-app-b53fc.appspot.com',
    iosBundleId: 'com.example.pizza',
  );
}