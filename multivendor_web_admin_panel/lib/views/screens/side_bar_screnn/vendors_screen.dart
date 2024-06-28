

import 'package:flutter/material.dart';

class VendorsScreen extends StatelessWidget {
  const VendorsScreen({super.key});
  static  const String routeName ='/VendorsScreen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: Text("Manage Vendors"),
      ));
  }
}