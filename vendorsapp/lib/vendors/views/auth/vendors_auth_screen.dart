import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider ;

import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendorsapp/vendors/views/auth/vendor_resiteration_screen.dart';

class VendorAuthScreen extends StatefulWidget {
  const VendorAuthScreen({super.key});

  @override
  State<VendorAuthScreen> createState() => _VendorAuthScreenState();
}

class _VendorAuthScreenState extends State<VendorAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, sanpshopt) {
          return !sanpshopt.hasData ? 
          SignInScreen(

            providers: [
              EmailAuthProvider(),  //it is pressent in both the of the packages so we can hide this form the FirebaseAuth pacakge the resion of we want use this from the FirebaseAuth_ui_auth package 


            ],
          ) :  VendorResigistrationScreen();
        });
  }
}
