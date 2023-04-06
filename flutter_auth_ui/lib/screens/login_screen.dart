import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/components/components.dart';
import 'package:flutter_auth_ui/components/under_part.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/controller/auth_controller.dart';
import 'package:flutter_auth_ui/screens/screens.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_auth_ui/model/user.dart';

class LoginScreen extends StatelessWidget {

  TextEditingController _emailController = new TextEditingController();
  TextEditingController _passwordController = new TextEditingController();

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
                // const PageTitleBar(title: 'Login to your account'),
                Padding(
                  padding: const EdgeInsets.only(top: 402.0),
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
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 65,
                          // child: Text("HEllO"),
                        ),
                        // const SizedBox(
                        //   height: 15,
                        // ),
                        // iconButton(context),

                        const Align(
                          alignment: Alignment(-0.6,0),
                          child: Text(
                            "Sign In",
                            // textAlign: TextAlign.right,
                            style: TextStyle(

                                color: Color(0xFF372A28),
                              fontFamily: 'PlayFairDisplay',
                                fontSize: 40,
                                ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),


                        Form(
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              TextFieldContainer(
                                child: TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(color: Color(0xFFFFF4EA)),
                                  cursorColor: const Color(0xFFFFF4EA),
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.email,
                                        color: Color(0xFFFFF4EA),
                                      ),
                                      hintText: 'Email',
                                      hintStyle: TextStyle(
                                          fontFamily: 'OpenSans',
                                          color: Color(0xFFFFF4EA)),
                                      border: InputBorder.none),
                                ),
                              ),
                              TextFieldContainer(
                                child: TextFormField(
                                  controller: _passwordController,
                                  style: const TextStyle(color: Color(0xFFFFF4EA)),
                                  obscureText: true,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                      icon: Icon(
                                        Icons.lock,
                                        color: Color(0xFFFFF4EA),
                                      ),
                                      hintText: "Password",
                                      hintStyle:  TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFF4EA)),
                                      suffixIcon: Icon(
                                        Icons.visibility,
                                        color: Colors.white,
                                      ),
                                      border: InputBorder.none),
                                ),
                              ),
                              // switchListTile(),
                              Container(
                                margin: EdgeInsets.all(20),
                                height: 50,
                                width: 300,
                                child: ElevatedButton(
                                   style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF946C0A),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                    onPressed: (){
                                      AuthController().login(_emailController.text, _passwordController.text);
                                    }, 
                                    child: Text("Login")
                                  ),
                              ),
                                const SizedBox(
                                  height: 20,
                                ),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Sign Up",
                                onTap: () {
                                  Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => SignUpScreen())
                                  );
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              const Text(
                                'Forgot password?',
                                style: TextStyle(
                                    color: Color(0xFF372A28),
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13),
                              ),
                              const SizedBox(height: 20,)
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

switchListTile() {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 40),
    child: SwitchListTile(
      dense: true,
      title: const Text(
        'Remember Me',
        style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
      ),
      value: true,
      activeColor: kPrimaryColor,
      onChanged: (val) {},
    ),
  );
}

iconButton(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: const [
      RoundedIcon(imageUrl: "assets/images/facebook.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/twitter.png"),
      SizedBox(
        width: 20,
      ),
      RoundedIcon(imageUrl: "assets/images/google.jpg"),
    ],
  );
}
