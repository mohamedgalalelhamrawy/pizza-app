import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:pizza/app.dart';
import 'package:user_repository/user_repository.dart';

void main() async {
  await  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
     options: const FirebaseOptions(
    apiKey: 'key',
    appId: 'id',
    messagingSenderId: 'sendid',
    projectId: 'myapp',
    storageBucket: 'myapp-b9yt18.appspot.com',
  )
  );
  runApp( MyApp(userRepository: Firebase_User_repo(),));
}


    
