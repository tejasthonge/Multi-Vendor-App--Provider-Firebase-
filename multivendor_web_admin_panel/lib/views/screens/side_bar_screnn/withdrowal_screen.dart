

import 'package:flutter/material.dart';

class WithdralSceen extends StatelessWidget {
  const WithdralSceen({super.key});
  static  const String routeName ='/WithdralSceen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: Text("Withdroal"),
      ));
  }
}