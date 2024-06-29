import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multivendor_web_admin_panel/views/screens/main_screen.dart';

void main() async {
  //image not displying of web due we runing web on web 
  //to show the images run --> flutter run -d chrome --web-renderer html
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
      options: kIsWeb || Platform.isAndroid
          ?const FirebaseOptions(
              apiKey: "AIzaSyAAoq99G52XC-lYu7fJKQjqgZ_1qB_xqHE",
              appId: "1:536573147244:web:42627cc61ab25e5dce8049",
              messagingSenderId: "536573147244",
              projectId: "multi-vendor-stroe",
              storageBucket: "multi-vendor-stroe.appspot.com",
            )
          : null);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return  MaterialApp(
      home: const MainScreen(),
      builder: EasyLoading.init(),
      );
  }
}
