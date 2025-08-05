import 'package:flutter/material.dart';

class MyelevatedButton extends StatelessWidget {
  const MyelevatedButton(
      {super.key, required this.onPressed, this.text = 'Continue'});
  final Function() onPressed;
  final String text;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        backgroundColor: Color(0xff1E88E5),
        minimumSize: Size(350, 50),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
    );
  }
}
