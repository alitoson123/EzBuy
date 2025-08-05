import 'package:flutter/material.dart';

class SignUpModel {
  final String myTextLabel;
  final String myHintText;
  final Icon myIcon;
  final void Function(String) onChanged;

  SignUpModel(
      {required this.myTextLabel,
      required this.myHintText,
      required this.myIcon,
      required this.onChanged});
}
