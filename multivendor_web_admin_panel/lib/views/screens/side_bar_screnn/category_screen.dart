import 'package:flutter/material.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  static  const String routeName ='/CategoryScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Container(
        padding: EdgeInsets.all(9),
        alignment: Alignment.topLeft,
        child: Text("Category"),
      ));
  }
}