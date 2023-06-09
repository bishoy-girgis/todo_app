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
    apiKey: 'AIzaSyCkO6rGi_dWcFpBNeDMptBef_mzEgi0cxg',
    appId: '1:734532296484:web:469fa55bbb132f50a0ddb1',
    messagingSenderId: '734532296484',
    projectId: 'todo-app-e65e4',
    authDomain: 'todo-app-e65e4.firebaseapp.com',
    storageBucket: 'todo-app-e65e4.appspot.com',
    measurementId: 'G-TVXHS3H009',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBni2-b7JlpLv-iZMlbjWbWXtr2GKAkvR0',
    appId: '1:734532296484:android:8999c18a6b84a6dfa0ddb1',
    messagingSenderId: '734532296484',
    projectId: 'todo-app-e65e4',
    storageBucket: 'todo-app-e65e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDBfyJ4FOuX5ZNqjfJqXSXEvZEPMheOJOQ',
    appId: '1:734532296484:ios:280703b2fb11ebc3a0ddb1',
    messagingSenderId: '734532296484',
    projectId: 'todo-app-e65e4',
    storageBucket: 'todo-app-e65e4.appspot.com',
    iosClientId: '734532296484-ed5pdc3i6j439kolo4gbsf2skc4omtlj.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDBfyJ4FOuX5ZNqjfJqXSXEvZEPMheOJOQ',
    appId: '1:734532296484:ios:280703b2fb11ebc3a0ddb1',
    messagingSenderId: '734532296484',
    projectId: 'todo-app-e65e4',
    storageBucket: 'todo-app-e65e4.appspot.com',
    iosClientId: '734532296484-ed5pdc3i6j439kolo4gbsf2skc4omtlj.apps.googleusercontent.com',
    iosBundleId: 'com.example.todoApp',
  );
}
