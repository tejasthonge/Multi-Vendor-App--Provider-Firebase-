

import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/utils/utils.dart';
import 'package:multivendor/views/buyers/auth/login_screen.dart';
import 'package:provider/provider.dart';

class BuyersRegistorScreen extends StatefulWidget {
  BuyersRegistorScreen({super.key});

  @override
  State<BuyersRegistorScreen> createState() => _BuyersRegistorScreenState();
}

class _BuyersRegistorScreenState extends State<BuyersRegistorScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AuthController _authController =  AuthController();

  Uint8List? _image;

  final TextEditingController emailTEC = TextEditingController();

  final TextEditingController fullNameTEC = TextEditingController();

  final TextEditingController phonNoTEC = TextEditingController();

  final TextEditingController passwordTEC = TextEditingController();

  _singUpUser(
    BuildContext context, {
    required AuthController authController,
    required String email,
    required String fullName,
    required String phoneNo,
    required String password,
  }) async {
    String res = "Enter all the information";
    if (_formKey.currentState!.validate() && _image != null) {
        res = await authController 
          .signUpUsers(
        email: email,
        fullName: fullName,
        phoneNo: phoneNo,
        password: password,
        image: _image!
      )
          .whenComplete(() {
        setState(() {
          emailTEC.text = '';
          fullNameTEC.text = '';
          phonNoTEC.text = '';
          passwordTEC.text = '';
        });
      });
    }
    else if(_image ==null) {
      showMySnakBar(context: context, message: "Please select Profile image");
    }


    showMySnakBar(context: context, message: res);
    if(res== 'User Created Successfully!'){
      Navigator.of(context, ).push(
        MaterialPageRoute(builder: (_)=>LoginScreen()),
      );
    }
  }

  selectGallaryImage({required BuildContext context,})async{
    Uint8List im = await _authController.pickProfilePicture(context: context, source: ImageSource.gallery);
    _image = im;
    
    setState(() {});

  }
  selectCameraImage({required BuildContext context,})async{
    Uint8List im = await _authController.pickProfilePicture(context: context, source: ImageSource.camera);
    _image = im;
    
    setState(() {});

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(builder: (context, authContoller, child) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 40,
                ),
                Text(
                  "Create Customers Account",
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20,),
                GestureDetector(
                  onTap: () {
                    showBottomSheet(

                      context: context, builder: (context,){
                      
                      return ClipRRect(
                        borderRadius: BorderRadius.only( 
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 70,
                          color: Colors.yellow.shade900,
                          child: Row( 
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [ 
                              GestureDetector( 
                                onTap: () {
                                  selectGallaryImage(context: context);
                                  Navigator.of(context).pop();
                        
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon( 
                                      Icons.photo,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "Gallery",
                                      style: TextStyle( 
                                        color: Colors.white,
                                        fontSize: 20
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector( 
                                onTap: (){
                                  selectCameraImage(context: context);
                                  Navigator.of(context).pop();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon( 
                                      Icons.camera,
                                      color: Colors.white,
                                    ),                      
                                    Text(
                                      "Camera",
                                      style: TextStyle( 
                                        color: Colors.white,
                                        fontSize: 20

                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                       
                    },);},
                  child: 
                  _image == null ?
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 56,
                        backgroundColor: Color.fromARGB(137, 219, 202, 202),
                        child: Icon(
                          Icons.person,
                          color: Colors.white,
                          size: 70,
                        ),
                      ),
                      Positioned(
                        top: 77,
                        left: 80,
                        child: Icon(
                          Icons.add_a_photo,
                        ),
                      )
                    ],
                  ):
                  Container( 
                    // radius: 64,
                    decoration: BoxDecoration( 
                      borderRadius: BorderRadius.circular(70),
                      border: Border.all(color: Colors.blue)
                    ),
                    height: 120,
                    width: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(70),
                      child: Image.memory(
                        _image!,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )

                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          controller: emailTEC,
                          decoration: InputDecoration(labelText: 'Enter Email'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter email';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: TextFormField(
                          controller: fullNameTEC,
                          decoration:
                              InputDecoration(labelText: 'Enter Full Name'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter full name';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: TextFormField(
                          keyboardType: TextInputType.phone,
                          controller: phonNoTEC,
                          decoration:
                              InputDecoration(labelText: 'Enter Phone Number'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter phone number';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: TextFormField(
                          obscureText: authContoller.obscureText,
                          controller: passwordTEC,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                              labelText: 'Password ',
                              suffixIcon: GestureDetector(
                                onTap: () => authContoller.onTapEye(),
                                child: Icon(
                                  authContoller.obscureText == true
                                      ? Icons.visibility_off
                                      : Icons.remove_red_eye,
                                  // Icons.password
                                ),
                              )),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if( authContoller.isLodding == false ){
                            _singUpUser(context,
                              authController: authContoller,
                              email: emailTEC.text.trim(),
                              fullName: fullNameTEC.text.trim(),
                              phoneNo: phonNoTEC.text.trim(),
                              password: passwordTEC.text.trim());

                          }


                          
                        },
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width - 30,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.yellow.shade900,
                              borderRadius: BorderRadius.circular(10)),
                          child: authContoller.isLodding == false
                              ? Text(
                                  "Resistor",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      letterSpacing: 4,
                                      fontWeight: FontWeight.bold),
                                )
                              : Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (_) => LoginScreen()));
                        },
                        child: Text(
                          "Login",
                        ))
                  ],
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
