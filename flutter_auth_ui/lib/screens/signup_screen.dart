// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/components/components.dart';
import 'package:flutter_auth_ui/components/under_part.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/controller/auth_controller.dart';
import 'package:flutter_auth_ui/screens/screens.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  final TextEditingController _setpasswordController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                const Upside(
                  imgUrl: "assets/images/yellow.jpg",
                ),
                // const PageTitleBar(title: 'Create New Account'),
                Padding(
                  padding: const EdgeInsets.only(top: 390.0),
                  child: Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      color: Color(0xFFFFD964),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Align(
                          alignment: Alignment(-0.6, 0),
                          child: Text(
                            "Sign Up",
                            // textAlign: TextAlign.right,
                            style: TextStyle(
                              color: Color(0xFF372A28),
                              fontFamily: 'PlayFairDisplay',
                              fontSize: 40,
                            ),
                          ),
                        ),
                        // iconButton(context),
                        const SizedBox(
                          height: 35,
                        ),

                        Form(
                          child: Column(
                            children: [
                              TextFieldContainer(
                                child: TextFormField(
                                  controller: _emailController,
                                  style: TextStyle(color: Color(0xFFFFF4EA)),
                                  cursorColor: Color(0xFFFFF4EA),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                        color: Color(0xFFFFF4EA),
                                      ),
                                      hintText: 'Email',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Color(0xFFFFF4EA)),
                                      border: InputBorder.none),
                                ),
                              ),
                              TextFieldContainer(
                                child: TextFormField(
                                  controller: _nameController,
                                  style: TextStyle(color: Color(0xFFFFF4EA)),
                                  cursorColor: Color(0xFFFFF4EA),
                                  decoration: InputDecoration(
                                      icon: Icon(
                                        Icons.person,
                                        color: Color(0xFFFFF4EA),
                                      ),
                                      hintText: 'Name',
                                      hintStyle: const TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Color(0xFFFFF4EA)),
                                      border: InputBorder.none),
                                ),
                              ),
                              TextFieldContainer(
                                child: TextFormField(
                                  controller: _setpasswordController,
                                  style: TextStyle(color: Color(0xFFFFF4EA)),
                                  obscureText: true,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.lock,
                                        color: Color(0xFFFFF4EA),
                                      ),
                                      hintText: "Password",
                                      hintStyle: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Color(0xFFFFF4EA)),
                                      suffixIcon: Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              
                              ElevatedButton(onPressed: (){
                                AuthController().SignUp(_emailController.text, _nameController.text, _setpasswordController.text);},
                                style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(horizontal: 130.0, vertical: 20.0),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(100.0)
                                    ),
                                    primary: Color(0xFF946C0A)
                                ),
                                child: Text('REGISTER'), ),
                              SizedBox(
                                height: 10,
                              ),
                              UnderPart(
                                title: "Already have an account?",
                                navigatorText: "Login here",
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}