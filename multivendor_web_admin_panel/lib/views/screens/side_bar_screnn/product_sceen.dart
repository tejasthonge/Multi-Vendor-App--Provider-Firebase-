
import 'package:flutter/material.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static  const String routeName ='/ProductScreen';

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: Text("Products"),
      );
  }
}