import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static  const String routeName ='/CategoryScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: const EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: const Text("Category"),
      ));
  }
}