import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class ContainerOffer extends StatelessWidget {
  const ContainerOffer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xff503F94), borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'A Summer surprise',
              style: Style().textStyle16,
            ),
            Text(
              'Cashback 20%',
              style: Style().textStyle22,
            )
          ],
        ),
      ),
    );
  }
}
