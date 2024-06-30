

import 'package:firebase_auth/firebase_auth.dart';

class AuthController {

  Future<String> signUpUsers({
    required String email ,
    required String fullName,
    required String phoneNo,
    required String password,
  })async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    String res = 'Some error occured';

    try {
      if(email.isNotEmpty && fullName.isNotEmpty && password.isNotEmpty){
        //create user
        UserCredential cread =  await _auth.createUserWithEmailAndPassword(email: email, password: password);
        res ='Success'; 
      }
      else{ 
        res ="Please Fields must not em pty";
      }
    } catch (e) {
      
    }
    return res;
  }
}