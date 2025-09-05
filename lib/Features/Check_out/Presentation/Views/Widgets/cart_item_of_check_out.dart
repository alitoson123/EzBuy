import 'package:flutter/material.dart';

class CartItemOfCheckOut extends StatelessWidget {
  const CartItemOfCheckOut({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: index == 4 ? 0 : 9),
      child: Container(
        width: 110,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xffECECEC),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Image.asset(
          'assets/images/download-removebg-preview.png',
        ),
      ),
    );
  }
}
