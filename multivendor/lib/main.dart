import 'package:flutter/material.dart';
import 'package:multivendor/views/buyers/main_screen.dart';

void main() {
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
      home: const MainScreen(),
      
    );
  }
}
