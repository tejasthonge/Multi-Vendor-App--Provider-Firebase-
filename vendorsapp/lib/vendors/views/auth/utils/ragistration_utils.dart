

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// showMyBottomSheetForPickingTheImage( 

//      {required BuildContext context,
   

  
//     required Function selectGallaryImage,
//      required Function selectCameraImage,
//     }
// ){
//   return showBottomSheet(

//                       context: context, builder: (context,){
                      
//                       return ClipRRect(
//                         borderRadius: BorderRadius.only( 
//                           topLeft: Radius.circular(20),
//                           topRight: Radius.circular(20),
//                         ),
//                         child: Container(
//                           width: MediaQuery.of(context).size.width,
//                           height: 70,
//                           color: Colors.yellow.shade900,
//                           child: Row( 
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             mainAxisSize: MainAxisSize.min,
//                             children: [ 
//                               GestureDetector( 
//                                 onTap: () {
//                                   selectGallaryImage(context: context);
//                                   Navigator.of(context).pop();
                        
//                                 },
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon( 
//                                       Icons.photo,
//                                       color: Colors.white,
//                                     ),
//                                     Text(
//                                       "Gallery",
//                                       style: TextStyle( 
//                                         color: Colors.white,
//                                         fontSize: 20
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               GestureDetector( 
//                                 onTap: (){
//                                   selectCameraImage(context: context);
//                                   Navigator.of(context).pop();
//                                 },
//                                 child: Row(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     Icon( 
//                                       Icons.camera,
//                                       color: Colors.white,
//                                     ),                      
//                                     Text(
//                                       "Camera",
//                                       style: TextStyle( 
//                                         color: Colors.white,
//                                         fontSize: 20

//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       );
                       
//                     },);
// }