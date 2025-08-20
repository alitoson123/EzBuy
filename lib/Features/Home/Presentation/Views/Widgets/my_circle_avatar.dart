import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  const MyCircleAvatar({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 24,
        backgroundColor: Color(0xffECECEC),
        child: Icon(icon, color: Colors.grey),
      ),
    );
  }
}
