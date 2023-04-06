import 'package:flutter/material.dart';
import '/constants.dart';
import '/widgets/widgets.dart';

class RoundedPasswordField extends StatelessWidget {
  const RoundedPasswordField({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(
        style: TextStyle(color: Color(0xFFFFF4EA)),
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
    );
  }
}