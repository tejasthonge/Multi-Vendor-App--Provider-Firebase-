import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:multivendor/firebase_options.dart';
import 'package:multivendor/views/buyers/auth/registor_screen.dart';
import 'package:multivendor/views/buyers/main_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options:DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Muti Vendor Shopping App',
      theme: ThemeData( 
        fontFamily:'Brand-Bold'
      ),
      home:  RegistorScreen(),
      
    );
  }
}
