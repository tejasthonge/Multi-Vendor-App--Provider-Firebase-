
import 'package:flutter/material.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/utils/utils.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});
  static  const String routeName ='/ProductScreen';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
    child: Column(
      children: [
        Container(
          padding:const  EdgeInsets.all(9),
          alignment: Alignment.topLeft,
          child: const Text("Products",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
          
          ),
        ),
        Row( 
          children: [ 
            buildRowHeador(flex: 1,text: "IMAGE"),
            buildRowHeador(flex: 3,text: "NAME"),
            buildRowHeador(flex: 2,text: "PRICE"),
            buildRowHeador(flex:2,text: "QUANTITY"),
            buildRowHeador(flex: 1,text: "ACTION"),
            buildRowHeador(flex: 1,text: "VIEW MORE"),
          ],
        )
      ],
    ));
  }
}