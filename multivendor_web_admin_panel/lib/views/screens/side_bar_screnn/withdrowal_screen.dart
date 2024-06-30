

import 'package:flutter/material.dart';
import 'package:multivendor_web_admin_panel/views/screens/side_bar_screnn/utils/utils.dart';

class WithdralSceen extends StatelessWidget {
  const WithdralSceen({super.key});
  static  const String routeName ='/WithdralSceen';


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(9),
            alignment: Alignment.topLeft,
            child: const Text("Withdroal",
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.w700),
            
            ),
          ),
           Row( 
            children: [ 
              buildRowHeador(flex: 1,text: "NAME"),
              buildRowHeador(flex: 3,text: "AMOUNT"),
              buildRowHeador(flex: 2,text: "BANK NAME"),
              buildRowHeador(flex:2,text: "BANK ACCOUNT"),
              buildRowHeador(flex: 1,text: "EMAIL"),
              buildRowHeador(flex: 1,text: "PHONE"),
            ],
          )
        ],
      ));
  }
}