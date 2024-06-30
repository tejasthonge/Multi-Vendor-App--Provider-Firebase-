



import 'package:flutter/material.dart';
import 'package:multivendor/views/buyers/auth/registor_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Login Coustormes Account",
                style: TextStyle(fontSize: 20 ),
              ),
          
        
              Column(
                children: [
                  Padding(padding: EdgeInsets.all(13),
                    child: TextFormField( 
                  
                      decoration: InputDecoration( 
                        labelText: 'Enter Email'
                      ),
                    ),
                  ),
                  
                  Padding(padding: EdgeInsets.all(13),
                    child: TextFormField( 
                  
                      decoration: InputDecoration( 
                        labelText: 'Password '
                      ),
                    ),
                  ),
        
                ],
              ),
        
              Container( 
                margin: EdgeInsets.only(top: 20),

                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width -30,
                height: 50,
                decoration: BoxDecoration( 
                  color: Colors.yellow.shade900 ,
                  borderRadius: BorderRadius.circular(10)
                ),
        
                child: Text( 
                  "Login",
                  style: TextStyle( 
                    color: Colors.white,
                    fontSize: 20 ,
                    letterSpacing: 4,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),

              Row( 
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  Text(
                    "Need An Account ?"
                  ), 
                  TextButton(onPressed: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_)=>RegistorScreen())
                    );
                  }, child: Text( 
                    "Resitor",

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