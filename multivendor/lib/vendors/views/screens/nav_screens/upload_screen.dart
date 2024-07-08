import 'package:flutter/material.dart';
import 'package:multivendor/vendors/controllers/vendor_product_conttroller.dart';
import 'package:multivendor/vendors/views/screens/nav_screens/upload_tab_screens/attrubutes_tab.dart';
import 'package:multivendor/vendors/views/screens/nav_screens/upload_tab_screens/genaral_tab.dart';
import 'package:multivendor/vendors/views/screens/nav_screens/upload_tab_screens/images_tab.dart';
import 'package:multivendor/vendors/views/screens/nav_screens/upload_tab_screens/shiping_tab.dart';
import 'package:provider/provider.dart';

class VendorUploadScreen extends StatelessWidget {
   VendorUploadScreen({super.key});

  List<Widget> _tabsList = <Widget>[ 
    //bellow are screen of respective tabs
    GeneralTab(),
    ShippingTab(),
    AttributesTab(),
    ImageTab()
  ];

  @override
  Widget build(BuildContext context) {
   VendorProductController  _vendorProductController = Provider.of<VendorProductController>(context);
    return DefaultTabController(
      length: 4,
      child: Scaffold( 
        appBar: AppBar( 
          
          elevation: 1,
          backgroundColor: Colors.yellow.shade900,
          foregroundColor: Colors.white,
          bottom: TabBar(
            
            unselectedLabelColor: Colors.white38,
            indicatorColor: Colors.white,
            indicatorSize: TabBarIndicatorSize.label,
            labelColor: Colors.white,
            tabs: [ 
              Tab( 
                child: Text( 
                  "General",
                  style: TextStyle( 
                    // color: Color.fromARGB(255, 255, 222, 222)
                  ),
                ),
              ),
              Tab( 
                child: Text( 
                  "Shipping",
                   style: TextStyle( 
                    // color: Colors.white
                  ),
                ),
              ),
              Tab( 
                child: Text( 
                  "Attributes",
                   style: TextStyle( 
                    // color: Colors.white
                  ),
                ),
              ),
              Tab( 
                child: Text( 
                  "Images",
                   style: TextStyle( 
                    // color: Colors.white
                  ),
                ),
              ),
              
            ],

            onTap: (value) {
              
            },
           ),
        ),
        body: TabBarView( 
          children: _tabsList
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton:  GestureDetector(
                onTap: (){
                  print(_vendorProductController.productData.toString()) ;
                  
                },
                child: Container(
                  margin: EdgeInsets.only(top: 20),
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width - 30,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.yellow.shade900,
                      borderRadius: BorderRadius.circular(6)),
                  child: true
                      ? Text(
                          "Save",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              letterSpacing: 2,
                              fontWeight: FontWeight.bold),
                        )
                      : Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
              ),
      ),
    );
  }
}