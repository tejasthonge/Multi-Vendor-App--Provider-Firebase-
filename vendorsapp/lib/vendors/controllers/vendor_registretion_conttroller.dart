import 'dart:typed_data';


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class VendorResigistrationController extends ChangeNotifier {

  final FirebaseStorage _storage =FirebaseStorage.instance;
  final FirebaseAuth _auth =FirebaseAuth.instance;
  final FirebaseFirestore _firestore =FirebaseFirestore.instance;
  bool _isLodding = false;
  bool get getLodding =>_isLodding;
  pickStorImage(
      {required ImageSource source, required BuildContext context}) async {
    final ImagePicker _imagePicker = ImagePicker();
    XFile? _xFile = await _imagePicker.pickImage(source: source);
    if (_xFile != null) {
      return await _xFile.readAsBytes();
    } else {
      return "No Image Selected";
    }
  }

  // FUNCTION TO STORE THE IMAGE IN STORAGE

  _uploadVendorImage({
    required Uint8List image,

  })async{

     Reference ref=  _storage.ref().child("VendorsProfilePicture").child(_auth.currentUser!.uid);
    UploadTask uploadTask =  ref.putData(image);
    TaskSnapshot taskSnapshot = await uploadTask;
   String imgUrl = await taskSnapshot.ref.getDownloadURL();
   return imgUrl;


  }

  Future<String> registedVendroData({
    
    required BuildContext context,
    required String businessName,
    required String phone,
    required String email,
    required String city,
    required String state,
    required String country,
    required String selecteTaxOption,
    required String taxNo,
    required Uint8List?  image,
  }) async {
    _isLodding = true;
    notifyListeners();
    String res = "some error occurred";

    try {
      // if (businessName.isNotEmpty &&
      //     phone.isNotEmpty &&
      //     email.isNotEmpty &&
      //     city.isNotEmpty &&
      //     state.isNotEmpty &&
      //     city.isNotEmpty &&
      //     selecteTaxOption.isNotEmpty&&
      //     taxNo.isNotEmpty
          

      //     // image!= null
      //     ) {
          
        //save Data in firebasefirestor
        String imgUrl =await _uploadVendorImage(image: image!);

        await _firestore.collection("User_Vendors").doc(_auth.currentUser!.uid).set(
          {
            "businessName" : businessName,
            "phone" : phone,
            "email" : email,
            "city" : city,
            "state" : state,
            "country" : country,
            "taxOption":selecteTaxOption,
            "taxNo" : taxNo,
            "approved":false,
            "image" : imgUrl,

          }
        );
      // } else {
        res = "plese enter all the field";
      // }
    } catch (e) {
     res = e.toString();
    }
    _isLodding = false;
    notifyListeners();
    return res;
  }


    // FUNCTION TO STORE THE IMAGE IN STORAGE ENDS HERE
}
