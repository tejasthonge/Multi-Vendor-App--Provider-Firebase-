

import 'package:flutter/material.dart';
import 'package:multivendor/views/buyers/main_screen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body:SizedBox(
        width: MediaQuery.of(context).size.width, 
        child: Column( 
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ 
        
            Text(
              'Your Shopping Cart is Empty ',
              
              style: TextStyle(
                color: Colors.black,
                fontSize: 22,
                letterSpacing: 4,
                fontWeight: FontWeight.bold
                ),
                
                ),

                 GestureDetector(
                        onTap: () {
                         Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_)=>MainScreen()), (route) => false);


                          
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 30,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade900,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                                  "Continue Shopping",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 3,
                                      fontWeight: FontWeight.bold),
                                )
                              
                        ),
                      ),
        

          ],
        ),
      )
    );
  }
}