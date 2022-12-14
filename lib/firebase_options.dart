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
        return macos;
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
    apiKey: 'AIzaSyCvfYg6AzTLHSKCCK61gNwCOxaTakg7KUk',
    appId: '1:845530150612:web:efb26ea761c6be3c3f6d41',
    messagingSenderId: '845530150612',
    projectId: 'maps-9cd0e',
    authDomain: 'maps-9cd0e.firebaseapp.com',
    storageBucket: 'maps-9cd0e.appspot.com',
    measurementId: 'G-S6EC0YY645',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC9kDz-k6ZlmpIrTH0s9ZbDHQM55pIziSA',
    appId: '1:845530150612:android:59828798fdf14ab23f6d41',
    messagingSenderId: '845530150612',
    projectId: 'maps-9cd0e',
    storageBucket: 'maps-9cd0e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC9ssJA_PlwoDw59YVB3tzEZ0Gw7q8cV_Q',
    appId: '1:845530150612:ios:30bb8626a92183f33f6d41',
    messagingSenderId: '845530150612',
    projectId: 'maps-9cd0e',
    storageBucket: 'maps-9cd0e.appspot.com',
    iosClientId: '845530150612-h5obem7n0br4bvampo0ibi49dgi81av5.apps.googleusercontent.com',
    iosBundleId: 'com.example.googlemaps',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC9ssJA_PlwoDw59YVB3tzEZ0Gw7q8cV_Q',
    appId: '1:845530150612:ios:30bb8626a92183f33f6d41',
    messagingSenderId: '845530150612',
    projectId: 'maps-9cd0e',
    storageBucket: 'maps-9cd0e.appspot.com',
    iosClientId: '845530150612-h5obem7n0br4bvampo0ibi49dgi81av5.apps.googleusercontent.com',
    iosBundleId: 'com.example.googlemaps',
  );
}
