import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class VendrorWidget extends StatefulWidget {
  const VendrorWidget({super.key});

  @override
  State<VendrorWidget> createState() => _VendrorWidgetState();
}

class _VendrorWidgetState extends State<VendrorWidget> {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Widget vendorDataScreen({required int flex, required Widget widget}) {
    return Expanded(
        flex: flex,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5,horizontal: 5),
          decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
          child: widget,
        ));
  }

  @override
  Widget build(BuildContext context) {
    final Stream<QuerySnapshot> _vendorStream = _firebaseFirestore.collection("User_Vendors").snapshots();

    return StreamBuilder<QuerySnapshot>(
      stream: _vendorStream,
      builder: (BuildContext context,AsyncSnapshot<QuerySnapshot> snapshot) {


        if(snapshot.hasError){
          return Center(
            child: Text(snapshot.error.toString()),
          );
        }
        if(snapshot.connectionState == ConnectionState.waiting){
          return Padding(

            padding: const EdgeInsets.only(top: 100.0),
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount:snapshot.data!.docs.length,
          // itemCount:1,
          itemBuilder: (context, index) {
            final vendorUserData = snapshot.data!.docs[index];
            return Container(
            child: Row(
              children: [
                vendorDataScreen(
                    flex: 1,
                    widget: Image.network(
                      vendorUserData["storeImage"],
                      fit: BoxFit.cover,
                    )),

                    //for name 
                vendorDataScreen(
                  flex: 3,
                  widget: Text(
                    vendorUserData["businessName"]
                  ),
                ),
                //city
                vendorDataScreen(
                  flex: 2,
                  widget: Text(
                    vendorUserData["cityValue"]
                  ),
                ),
                //state
                vendorDataScreen(
                  flex: 2,
                  widget: Text(
                    vendorUserData["stateValue"]
                  ),
                ),
                vendorDataScreen(
                  flex: 1,
                  widget:
                  
                  vendorUserData["approved"] == false?

                   ElevatedButton(
                      onPressed: () async{
                        await _firebaseFirestore.collection("User_Vendors").doc(vendorUserData['vendorId']).update({
                          "approved":true
                        });
                      },
                      style: ButtonStyle(
                          // side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
          
                          // )),
                          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                              (Set<MaterialState> states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            );
                          }),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blueAccent)),
                      child:const Text(
                        "Approved",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w500,
                        ),
                      )):

                       ElevatedButton(
                      onPressed: () async{
                        await _firebaseFirestore.collection("User_Vendors").doc(vendorUserData['vendorId']).update({
                          "approved":false
                        });
                      },
                      style: ButtonStyle(
                          // side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
          
                          // )),
                          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                              (Set<MaterialState> states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            );
                          }),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blueAccent)),
                      child:const Text(
                        "Reject",
                        style: TextStyle(
                          color: Colors.redAccent,
                          // fontWeight: FontWeight.w500,
                        ),
                      ))
                      
                      ,
                ),
               
          
               vendorDataScreen(
                  flex: 1,
                  widget: ElevatedButton(
                      onPressed: () {
                        
                      },
                      style: ButtonStyle(
                          // side: MaterialStateBorderSide.resolveWith((states) => BorderSide(
          
                          // )),
                          shape: MaterialStateProperty.resolveWith<OutlinedBorder>(
                              (Set<MaterialState> states) {
                            return RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2.0),
                            );
                          }),
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => Colors.blueAccent)),
                      child:const Text(
                        "Deatial",
                        style: TextStyle(
                          color: Colors.white,
                          // fontWeight: FontWeight.w500,
                        ),
                      )),
                ),
              ],
            ),
          );
          },
        );
      }
    );
  }
}
