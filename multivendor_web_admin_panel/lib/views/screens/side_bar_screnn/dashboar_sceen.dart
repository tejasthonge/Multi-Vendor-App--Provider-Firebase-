

import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});
  static  const String routeName ='/DashboardScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: const EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child:const  Text("Dashboard"),
      ));
  }
}