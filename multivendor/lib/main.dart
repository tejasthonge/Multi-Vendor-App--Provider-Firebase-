import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/firebase_options.dart';
import 'package:multivendor/vendors/controllers/vendor_registretion_conttroller.dart';
import 'package:multivendor/vendors/views/screens/main_vendors_screen.dart';
import 'package:multivendor/views/buyers/auth/registor_screen.dart';
import 'package:provider/provider.dart';

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
    return  MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(),

        ),
        ChangeNotifierProvider(
           create: (_) =>VendorResigistrationController()
        )
      ],
      child: MaterialApp(
        title: 'Muti Vendor Shopping App',
        theme: ThemeData( 
          fontFamily:'Brand-Bold'
        ),
        builder: EasyLoading.init(),
        home:  BuyersRegistorScreen(),
        // home: VendorAuthScreen(),
        // home: MainVendorScreen(),
        
      ),
    );
  }
}
