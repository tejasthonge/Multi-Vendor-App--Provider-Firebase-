
import 'package:flutter/material.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/utils/utils.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});
  static  const String routeName ='/OrdersScreen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    
    child: Column(
      children: [
        Container(
          padding:const  EdgeInsets.all(9),
          alignment: Alignment.topLeft,
          child: const Text("Mange Orders",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
          
          ),
        ),
        Row( 
          children: [ 
            buildRowHeador(flex: 1,text: "IMAGE"),
            buildRowHeador(flex: 3,text: "FULL NAME"),
            buildRowHeador(flex: 2,text: "CITY"),
            buildRowHeador(flex:2,text: "STATE"),
            buildRowHeador(flex: 1,text: "ACTION"),
            buildRowHeador(flex: 1,text: "VIEW MORE"),
          ],
        )
      ],
    ));
  }
}