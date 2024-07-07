import 'package:flutter/material.dart';

class VendorUploadScreen extends StatelessWidget {
  const VendorUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

          children: [ 
            Center(child: Text("General"),),
            Center(child: Text("Shopping"),),
            Center(child: Text("Attributs"),),
            Center(child: Text("Images"),),
          ],
        )
      ),
    );
  }
}