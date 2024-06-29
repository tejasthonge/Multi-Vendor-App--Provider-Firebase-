
import 'package:flutter/material.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static  const String routeName ='/OrdersScreen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: const EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: const Text("Orders"),
      ));
  }
}