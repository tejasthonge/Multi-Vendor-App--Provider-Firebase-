

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/views/buyers/auth/login_screen.dart';

class RegistorScreen extends StatelessWidget {
  RegistorScreen({super.key});
  final AuthController _authController = AuthController();
  final TextEditingController emailTEC = TextEditingController();
  final TextEditingController fullNameTEC = TextEditingController();
  final TextEditingController phonNoTEC = TextEditingController();
  final TextEditingController passwordTEC = TextEditingController();

  _singUpUser({
    required String email,
    required String fullName,
    required String phoneNo,
    required String password,
  })async{
   String res = await  _authController.signUpUsers(email: email, fullName: fullName, phoneNo: phoneNo, password: password);

   if(res != "Success"){
    print(res);

   }
   else if(res == "Success"){
    print(res);
   }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold( 

      body: SingleChildScrollView(
        child: Center(
          child: Column ( 
            mainAxisAlignment: MainAxisAlignment.center,
            children: [ 
              const SizedBox(height: 40,),
          
              Text(
                "Create Coustormes Account",
                style: TextStyle(fontSize: 20 ),
              ),
              CircleAvatar( 
                radius: 64,
                backgroundColor: Colors.yellow.shade900,
              ),
        
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(13),
                    child: TextFormField( 
                      controller: emailTEC,
                      decoration: InputDecoration( 
                        labelText: 'Enter Email'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(13),
                    child: TextFormField( 
                      controller: fullNameTEC,
                      decoration: InputDecoration( 
                        labelText: 'Enter Full Name'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(13),
                    child: TextFormField( 
                      controller: phonNoTEC,
                      decoration: InputDecoration( 
                        labelText: 'Enter Phone Number'
                      ),
                    ),
                  ),
                  Padding(padding: EdgeInsets.all(13),
                    child: TextFormField( 
                      controller: passwordTEC,
                      
                      decoration: InputDecoration( 
                        labelText: 'Password ',
                      ), 
                    ),
                  ),
        
                ],
              ),
        
              GestureDetector(
                onTap: () {
                  _singUpUser(email: emailTEC.text.trim(), fullName: fullNameTEC.text.trim(), phoneNo: phonNoTEC.text.trim(), password: passwordTEC.text.trim());
                },
                child: Container( 
                  margin: EdgeInsets.only(top: 20),
                
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width -30,
                  height: 50,
                  decoration: BoxDecoration( 
                    color: Colors.yellow.shade900 ,
                    borderRadius: BorderRadius.circular(10)
                  ),
                        
                  child: Text( 
                    "Resistor",
                    style: TextStyle( 
                      color: Colors.white,
                      fontSize: 20 ,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),

              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text(
                    "Already have an account ?"
                  ), 
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_)=>LoginScreen())
                    );
                  }, child: Text( 
                    "Login",

                  ))
                ],
              )
        
            ],
          ),
        ),
      ),
    );
  }
}