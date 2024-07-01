import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:multivendor/controllers/auth_controller.dart';
import 'package:multivendor/utils/utils.dart';
import 'package:multivendor/views/buyers/auth/registor_screen.dart';
import 'package:multivendor/views/buyers/main_screen.dart';
import 'package:multivendor/views/buyers/nav_screens/home_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String res = "Enter all the information";

  final TextEditingController _emailTEC = TextEditingController();
  final TextEditingController _passwordTEC = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _loginUser(
      {required String email,
      required String password,
      required AuthController authController}) async {
    if (_formKey.currentState!.validate()) {
      res = await authController
          .loginUser(email: email, password: password)
          .whenComplete(() {
        setState(() {
          _emailTEC.text = '';
          _passwordTEC.text = '';
        });
      });

      if(res == "Login Successfull"){
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
          (route) => false,
        );
      }
    }
    showMySnakBar(context: context, message: res);
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
                  "Login Coustormes Account",
                  style: TextStyle(fontSize: 20),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: TextFormField(
                          controller: _emailTEC,
                          decoration: InputDecoration(labelText: 'Enter Email'),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "Please enter a valid email";
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(13),
                        child: TextFormField(
                          obscureText: authContoller.obscureText,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter Password';
                            }
                            return null;
                          },
                          controller: _passwordTEC,
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
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _loginUser(
                        email: _emailTEC.text.trim(),
                        password: _passwordTEC.text.trim(),
                        authController: authContoller);
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
                              "Login",
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
                            )),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Need An Account ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => RegistorScreen()));
                        },
                        child: Text(
                          "Resitor",
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
