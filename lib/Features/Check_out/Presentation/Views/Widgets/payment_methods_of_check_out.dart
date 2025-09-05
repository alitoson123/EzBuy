import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class PaymentMethodsOfCheckOut extends StatelessWidget {
  const PaymentMethodsOfCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment Methods',
          style: Style().textStyle20,
        ),
        SizedBox(height: 10),
        Container(
          width: 120,
          height: 55,
          decoration: BoxDecoration(
            color: Color(0xffECECEC),
            borderRadius: BorderRadius.circular(15),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Image.asset(
              'assets/images/PayPal_Logo_Horizontal_Full_Color_RGB-002-1.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
      ],
    );
  }
}
