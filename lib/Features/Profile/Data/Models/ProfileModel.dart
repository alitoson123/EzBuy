import 'package:flutter/material.dart';

class Profilemodel {
  final String title;
  final IconData leadingIcon;
  final void Function(BuildContext context) onTap;
  Profilemodel(
      {required this.onTap, required this.title, required this.leadingIcon});
}
