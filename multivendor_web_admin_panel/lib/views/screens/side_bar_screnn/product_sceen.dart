
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static  const String routeName ='/ProductScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding:const  EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: const Text("Products"),
      );
  }
}