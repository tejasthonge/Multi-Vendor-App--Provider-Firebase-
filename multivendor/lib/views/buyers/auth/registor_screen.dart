import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/utils/utils.dart';
import 'package:multivendor/views/buyers/auth/login_screen.dart';
import 'package:provider/provider.dart';

class RegistorScreen extends StatefulWidget {
  RegistorScreen({super.key});

  @override
  State<RegistorScreen> createState() => _RegistorScreenState();
}

class _RegistorScreenState extends State<RegistorScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // final AuthController _authController = AuthController();

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
    if (_formKey.currentState!.validate()) {
      res = await authController.signUpUsers(
        email: email,
        fullName: fullName,
        phoneNo: phoneNo,
        password: password,
      ).whenComplete(() {
        setState(() {
          emailTEC.text = '';
          fullNameTEC.text = '';
          phonNoTEC.text = '';
          passwordTEC.text = '';
          // _formKey.currentState!.reset();
        });
      });
    }

    showMySnakBar(context: context, message: res);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<AuthController>(
        builder: (context,authContoller,child) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 40,
                  ),
                  Text(
                    "Create Coustormes Account",
                    style: TextStyle(fontSize: 20),
                  ),
                  CircleAvatar(
                    radius: 64,
                    backgroundColor: Colors.yellow.shade900,
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
                                  authContoller.obscureText == true?
                                  Icons.visibility_off:
                                  Icons.remove_red_eye,
                                  // Icons.password
                                  
                                ),
                              )
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _singUpUser(context,
                                authController: authContoller,
                                email: emailTEC.text.trim(),
                                fullName: fullNameTEC.text.trim(),
                                phoneNo: phonNoTEC.text.trim(),
                                password: passwordTEC.text.trim());
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width - 30,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.yellow.shade900,
                                borderRadius: BorderRadius.circular(10)),
                            child:
                            authContoller.isLodding == false?
                             Text(
                              "Resistor",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  letterSpacing: 4,
                                  fontWeight: FontWeight.bold),
                            ):
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center( 
                                  child: CircularProgressIndicator(
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ,
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
        }
      ),
    );
  }
}
