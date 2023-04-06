import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_auth_ui/controller/auth_controller.dart';


class Account extends StatefulWidget {
  // const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final AuthController authController = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFFFBF0E6),
        body: 
              Center(
                child: ElevatedButton(
                  onPressed: () => {authController.signOut()}, child: Text("Log Out"),
                  style: ElevatedButton.styleFrom(
              primary: Color(0xFF946C0A),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
                ),
              ));
  
  }
}