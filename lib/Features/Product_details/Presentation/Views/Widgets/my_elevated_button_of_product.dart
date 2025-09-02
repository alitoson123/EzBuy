import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class MyElevatedButtonOfProduct extends StatelessWidget {
  const MyElevatedButtonOfProduct({
    super.key,
    required this.text,
    required this.minimumSize,
  });
  final Size minimumSize;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          backgroundColor: Color(0xff1E88E5),
          minimumSize: minimumSize),
      child: Text(
        text,
        style: Style().textStyle20.copyWith(color: Colors.white),
      ),
    );
  }
}
