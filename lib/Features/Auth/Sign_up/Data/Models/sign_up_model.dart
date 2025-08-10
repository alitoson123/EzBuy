import 'package:flutter/material.dart';

class SignUpModel {
  final String myTextLabel;
  final String myHintText;
  final Icon myIcon;
  void Function(String)? onChanged;

  SignUpModel(
      {required this.myTextLabel,
      required this.myHintText,
      required this.myIcon,
      this.onChanged});
}
