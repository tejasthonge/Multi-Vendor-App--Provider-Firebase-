



import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivendor/utils/utils.dart';

class AuthController extends ChangeNotifier{
  bool _isLodding = false;
  bool get isLodding => _isLodding;
  bool _obscureText = true;
  bool get obscureText => _obscureText;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  FirebaseStorage _storage= FirebaseStorage.instance;





  pickProfilePicture(
    {
      required BuildContext context,
      required ImageSource source,
    }
  ) async {
    ImagePicker _imagePicker = ImagePicker();
    XFile? _imageFile = await _imagePicker.pickImage(source: source);
    if (_imageFile != null) {
      return _imageFile.readAsBytes();
    } else {
      showMySnakBar(
          context: context, message: "You are not Sellected any Image");
    }
  }

  _upalodProfilePictureAndGetUrl(Uint8List image)async{
    Reference ref = await _storage.ref().child("BuyerProfilePicture").child(_auth.currentUser!.uid);

    UploadTask uploadTask  =  ref.putData(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageURl = await snapshot.ref.getDownloadURL();
    return imageURl;

  }
  
   onTapEye() {
    _obscureText =!_obscureText;
    notifyListeners();
  }
  
  Future<String> signUpUsers({
    required String email ,
    required String fullName,
    required String phoneNo,
    required String password,
    required Uint8List? image
  })async{
    _isLodding = true;
    notifyListeners();
    String res = '';

    try {
      if(email.isNotEmpty && fullName.isNotEmpty && password.isNotEmpty && image != null ){
        //create user
        UserCredential cread =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
        String profileImageUrl = await _upalodProfilePictureAndGetUrl(image);

        await _firestore.collection("User_Buyers").doc(cread.user!.uid).set(
           {
             'buyerId' : cread.user!.uid,
             "email": email,
             "fullName": fullName,
             "phoneNo": phoneNo,
             "password": password,
             "address": '',
             "profileImageUrl": profileImageUrl
           }
          );
        res ='User Created Successfully!'; 

      }
      else{ 
        res ="This field is required and cannot be empty";
      }
    }on FirebaseAuthException catch (e) {
      log(e.code);
      res =e.code;
    }
    on FirebaseFirestore catch (e){
      log(e.toString());
      res = e.toString();
    }
    catch (e){
      res = e.toString();
    }
    _isLodding = false;
    notifyListeners();
    return res;
  }



  //for login

  Future<String> loginUser({
    required String email,
    required String password,
  } )async{

    _isLodding = true;
    notifyListeners();
    String res = '';

    try{
      if(email.isNotEmpty && password.isNotEmpty){
        UserCredential cread = await _auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );
        res = 'Login Successfull';
      }
      else{
        res = "This field is required and cannot be empty";
      }

    } on FirebaseAuthException catch (e){
      res = e.code;
    }
    catch (e){
      res = e.toString();
    }
    _isLodding = false; 
    notifyListeners();
    return res;
  }



}