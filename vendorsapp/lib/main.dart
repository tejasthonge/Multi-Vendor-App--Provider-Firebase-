import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';
import 'package:vendorsapp/vendors/controllers/vendor_registretion_conttroller.dart';
import 'package:vendorsapp/vendors/views/auth/vendors_auth_screen.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform  
  );
  runApp(const MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ 
        ChangeNotifierProvider( 
          create: (context) => VendorResigistrationController(),
        )
      ],
      child:  MaterialApp(
        title: 'Flutter Demo',
        
        home: const VendorAuthScreen(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
