
import 'package:flutter/material.dart';

class ContainerOfProductImage extends StatelessWidget {
  const ContainerOfProductImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: double.infinity,
      height: 250,
      decoration: BoxDecoration(
        color: Color(0xffEDEFF1),
        // borderRadius: BorderRadius.circular(15),
      ),
      child: Image.asset('assets/images/download-removebg-preview.png'),
    );
  }
}
