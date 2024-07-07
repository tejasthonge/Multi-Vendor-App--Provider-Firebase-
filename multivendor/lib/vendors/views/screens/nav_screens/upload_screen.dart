import 'package:flutter/material.dart';

class VendorUploadScreen extends StatelessWidget {
  const VendorUploadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold( 
        appBar: AppBar( 
          bottom: TabBar(
            tabs: [ 
              Tab( 
                child: Text( 
                  "General"
                ),
              ),
              Tab( 
                child: Text( 
                  "Shipping"
                ),
              ),
              Tab( 
                child: Text( 
                  "Attributes"
                ),
              ),
              Tab( 
                child: Text( 
                  "Images"
                ),
              ),
              
            ],
           ),
        ),
        body: Center(
          child: Text('Upload screen'),
        ),
      ),
    );
  }
}