import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/model/user.dart';
import 'package:get/get.dart';
import 'package:flutter_auth_ui/screens/login_screen.dart';
import 'package:flutter_auth_ui/screens/signup_screen.dart';
import 'package:flutter_auth_ui/screens/home.dart';

class AuthController extends GetxController {
  late Rx<User?> _user;
  User get user => _user.value!;

// _user  - Nadi
  // _user.bindStream - Nadi Me Color Deko
  //ever - Aap Ho
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);

    //Rx - Observable Keyword - Continously Checking Variable Is Changing Or Not.
  }

  _setInitialView(User? user) {
    if (user == null) {
      Get.offAll(() => LoginScreen());
    } else {
      Get.offAll(() => TabsController());
    }
  }

  //User Register
  void SignUp(
    String email,
    String name,
    String password,
  ) async {
    try {
      if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
        UserCredential credential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        myUser user =
            myUser(name: name, email: email, uid: credential.user!.uid);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(credential.user!.uid)
            .set(user.toJson());
      }
    } catch (e) {
      print(e);
      Get.snackbar("Error Occurred", e.toString());
    }
  }

  void login(
    String email,
    String password,
  ) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
      } else {
        Get.snackbar("Error Logging In", "Please enter all the fields");
      }
    } catch (e) {
      Get.snackbar("Error Logging In", e.toString());
    }
  }

  signOut() {
    FirebaseAuth.instance.signOut();
    Get.offAll(LoginScreen());
  }
}
