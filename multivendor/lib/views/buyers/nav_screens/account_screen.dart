

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        // backgroundColor: Colors.yellow.shade900,
        backgroundColor: Colors.transparent,
        
        centerTitle: true,
        title: Text("Profile",
        style: TextStyle( 
          // color: Colors.white,
          letterSpacing: 4
        ),
        ),
        actions: [ 
          IconButton(
            icon: Icon(
              color:Colors.yellow.shade900,
              Icons.dark_mode),
            onPressed: () {

            },
          ),
        ],
      ), 
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
              CircleAvatar( 
                radius: 64,
                // backgroundImage: AssetImage("assets/images/avatar.png"),
              ),
              const SizedBox(height: 20,),
              Text(
                "<NAME>",
                style: TextStyle(
                  fontSize: 17  ,
                  fontWeight: FontWeight.bold
                )),
          
                Text(
                "<Gmail>",
                style: TextStyle(
                  fontSize: 14  ,
                  fontWeight: FontWeight.bold
                )),
          
                // const SizedBox(height: 20,),

                Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 200,
                          height: 35,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade900,
                              borderRadius: BorderRadius.circular(10)),
                          child: Text(
                                  "Edit  profile",
                                  style: TextStyle(
                                      color: Colors.white,
                                      // fontSize: ,
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold),
                                )
                            
                                ),
                        
                const SizedBox(height: 20,),
          
                Divider(color: Colors.grey,),

                // const SizedBox(height: 20,),

                ListTile( 
                  leading: Icon(Icons.settings,color: Colors.grey),
                  title: Text("Settings",style: TextStyle( 
                            color:Colors.grey.shade700
                        ),),
                ),
                ListTile( 
                  leading: Icon(Icons.phone,color: Colors.grey),
                  title: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Phone",
                        style: TextStyle( 
                            color: Colors.grey.shade700
                        ),
                      ),
                      Text("08123456789",
                        style: TextStyle( 
                          fontSize: 10,color: Colors.grey
                        ),
                      ),  
                    ],
                  ),
                ),
               
              ListTile( 
                  leading: Icon(CupertinoIcons.cart_badge_plus ,color: Colors.grey),
                  title: Text("Cart",style: TextStyle( 
                            color: Colors.grey.shade700
                        ),),
                ),
                ListTile( 
                  leading: Icon(Icons.shopping_cart,color: Colors.grey),
                  title: Text("Orders",style: TextStyle( 
                            color: Colors.grey.shade700
                        ),),
                ),
                
                ListTile( 
                  leading: Icon(Icons.logout ,color:Colors.yellow.shade900),
                  title: Text("Logout",style: TextStyle( 
                            color: Colors.yellow.shade900
                        ),),
                ),
                
            ],
          ),
        ),
      ),
    );
  }
}