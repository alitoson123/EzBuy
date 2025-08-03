import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  const MyTextField(
      {super.key,
      required this.myTextLabel,
      required this.myHintText,
      required this.myIcon,
      required this.onChanged});
  final String myTextLabel;
  final String myHintText;
  final Icon myIcon;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText:
          myTextLabel == 'Password' || myTextLabel == 'Confirm Password'
              ? true
              : false,
      onChanged: onChanged,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Please Enter your $myTextLabel';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: myTextLabel,
        floatingLabelBehavior: FloatingLabelBehavior.auto,
        floatingLabelStyle: TextStyle(color: KPrimaryColor),
        contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 18),
        suffixIcon: myIcon,
        hintText: myHintText,
        focusedBorder: focusOutLineInputBorder(),
        border: borderOutLineInputBorder(),
      ),
    );
  }

  OutlineInputBorder borderOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
    );
  }

  OutlineInputBorder focusOutLineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(20),
      borderSide: BorderSide(color: Colors.black),
    );
  }
}
