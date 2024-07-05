
  // we only want the current user data  then we use as followein 


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:vendorsapp/vendors/models/vendors_user_model.dart';
import 'package:vendorsapp/vendors/views/auth/vendor_resiteration_screen.dart';
import 'package:vendorsapp/vendors/views/screens/main_vendors_screen.dart';

class LandingScreen extends StatelessWidget {
   LandingScreen({super.key});
   final FirebaseAuth _auth = FirebaseAuth.instance;

   //forllowing is used for the all the qurres on fon the list   
//  final Stream<QuerySnapshot> _vendorsStream = FirebaseFirestore.instance.collection('User_Vendors').snapshots();
  // but we only want the current user data  then we use as followein 
 final CollectionReference _vendorsStream = FirebaseFirestore.instance.collection('User_Vendors');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<DocumentSnapshot>(
        stream: _vendorsStream.doc(_auth.currentUser!.uid).snapshots(),
        builder: (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }
      
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading");
          }
          if(!snapshot.data!.exists){  //################################
            return VendorResigistrationScreen();
          }

          VendorsUserModel vendorsUserModel = VendorsUserModel.fromJson(
            snapshot.data!.data() as Map<String ,dynamic>,
          );

          if( vendorsUserModel.approved == true){
            return const MainVendorScreen();
          }
          return Center(  
              child: Padding(

                padding: const EdgeInsets.all(20.0),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5), 
                    child: Image.network(
                      width: 90,
                      height: 90,
                      
                      vendorsUserModel.storeImage,
                      fit: BoxFit.cover,
                    ),
                    ),
                    const SizedBox(height: 15,),
                
                    Text(
                      vendorsUserModel.businessName,
                
                      style:const TextStyle( 
                        // color: 
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                
                    const SizedBox(height:20),
                
                    const Text(
                      textAlign: TextAlign.center,
                      "Your Application has been sent to the Shop Admin \n admin will be get back to the to you Soon",
                      style: TextStyle( 
                        color: Color.fromARGB(255, 105, 103, 103),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                
                    // Spacer(),
                    const SizedBox( height:70),
                    InkWell(
                      onTap: ()async{
                        await _auth.signOut();
                      },
                      child: Container( 
                        width: double.infinity,
                        height: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration( 
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all()
                
                        ),
                        child: Text( 
                          'Sign out',
                          style: TextStyle( 
                            color: Colors.red
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height:20),
                
                  ],
                ),
              ),
          );
        },
      ),
    );
  }
}