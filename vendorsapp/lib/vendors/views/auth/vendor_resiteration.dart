

import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VendorResigistrationScreen extends StatefulWidget {
  const VendorResigistrationScreen({super.key});

  @override
  State<VendorResigistrationScreen> createState() => _VendorResigistrationScreenState();
}

class _VendorResigistrationScreenState extends State<VendorResigistrationScreen> {
  late String stateValue;
  late String cityValue;
  // late String addressValue;
  late String countryValue;
  @override
  Widget build(BuildContext context) {
    return  Scaffold( 

      body: CustomScrollView( 
        slivers: [
          SliverAppBar( 
            toolbarHeight: 200 ,
            backgroundColor: Colors.pink,

            flexibleSpace: LayoutBuilder(builder: ((context, constraints){ 
              return FlexibleSpaceBar(
                background:  Container( 
                  decoration: BoxDecoration( 

                    gradient: LinearGradient( 
                      colors: [ 
                        Colors.yellow.shade900, 
                        Colors.yellow,
                      ]
                    )
                  ),
                  child: Center( 
                    child: Column( 
                      mainAxisAlignment: MainAxisAlignment.center ,
                      children: [ 
                        Container( 
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration( 
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)
                          ),
                          child: IconButton( 
                            onPressed: (){},
                            icon:Icon( 
                              CupertinoIcons.photo
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            }))
          ),
          SliverToBoxAdapter( 

            child: Padding( 
              padding: EdgeInsets.all(10),

              child: Column( 

                children: [ 

                  TextFormField( 
                    keyboardType: TextInputType.name,
                    decoration: const InputDecoration( 
                      labelText: "Business Name",
                    ),),
                    const SizedBox(height: 10,),
                  
                  TextFormField( 
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration( 
                      labelText: "Email Address",
                    ),),
                    const SizedBox(height: 10,),
                  
                  TextFormField( 
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration( 
                      labelText: "Phone Number",
                    ),),
                    const SizedBox(height: 10,),

                     SelectState(
              onCountryChanged: (value) {
              setState(() {
                countryValue = value;
              });
            },
            onStateChanged:(value) {
              setState(() {
                stateValue = value;
              });
            },
             onCityChanged:(value) {
              setState(() {
                cityValue = value;
              });
            },
            
            ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}