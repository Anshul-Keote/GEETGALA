import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/screens/screens.dart';
import 'package:get/get.dart';
import 'screens/discover.dart';
import 'package:flutter_auth_ui/controller/auth_controller.dart';
// import 'package:flutter_auth_ui/screens/signup_screen.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value){
    Get.put(AuthController());
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Discover()
    );
  }
}
