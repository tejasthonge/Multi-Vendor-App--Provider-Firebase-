





import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:vendorsapp/vendors/models/vendors_user_model.dart';

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

        //save Data in firebasefirestor
        String imgUrl =await _uploadVendorImage(image: image!);
        
        VendorsUserModel obj = VendorsUserModel( 
          approved: false,
          vendorId:_auth.currentUser!.uid,
          businessName: businessName,
          phoneNumber: phone,
          email: email,
          storeImage: imgUrl,
          stateValue: state,
          cityValue: city,
          countryValue: country,
          takNumber: taxNo,
          takRegistored: selecteTaxOption,
          
        );
        await _firestore.collection("User_Vendors").doc(_auth.currentUser!.uid).set(
          obj.toJson(),
        );

        res = "plese enter all the field";

    }on FirebaseFirestore catch (e) {
     res = e.toString();
    }

    _isLodding = false;
    notifyListeners();
    return res;
  }


    // FUNCTION TO STORE THE IMAGE IN STORAGE ENDS HERE
}
