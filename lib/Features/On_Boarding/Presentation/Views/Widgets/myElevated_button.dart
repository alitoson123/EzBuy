import 'package:flutter/material.dart';

class MyelevatedButton extends StatelessWidget {
  const MyelevatedButton({super.key,required this.onPressed});
  final Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        'Continue',
        style: TextStyle(
          color: Colors.white,
          fontSize: 16,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(17)),
        backgroundColor: Color(0xff1E88E5),
        minimumSize: Size(350, 50),
      ),
    );
  }
}
