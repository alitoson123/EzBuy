import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class MyElevatedButtonOfProduct extends StatelessWidget {
  const MyElevatedButtonOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xff1E88E5), minimumSize: Size(290, 47)),
      child: Text(
        'Add to Cart',
        style: Style().textStyle20.copyWith(color: Colors.white),
      ),
    );
  }
}
