import 'package:flutter/material.dart';
import 'package:flutter_auth_ui/constants.dart';
import 'package:flutter_auth_ui/widgets/widgets.dart';

class RoundedInputField extends StatelessWidget {
  const RoundedInputField({Key? key, this.hintText, this.icon = Icons.person})
      : super(key: key);
  final String? hintText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextFormField(

        style: TextStyle(color: Color(0xFFFFF4EA)),
        cursorColor: Color(0xFFFFF4EA),
        decoration: InputDecoration(

            icon: Icon(
              icon,
              color: Color(0xFFFFF4EA),
            ),
            hintText: hintText,
            hintStyle: const TextStyle(fontFamily: 'OpenSans', color: Color(0xFFFFF4EA)),
            border: InputBorder.none),
      ),
    );
  }
}
