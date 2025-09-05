import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class OrderSummaryCheckOut extends StatelessWidget {
  const OrderSummaryCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Summary',
          style: Style().textStyle20,
        ),
        SizedBox(height: 10),
        Opacity(
          opacity: .5,
          child: Row(
            children: [
              Text(
                'Subtotal',
                style: Style().textStyle16,
              ),
              Spacer(),
              Text(
                '\$ 9999.9',
                style: Style().textStyle16,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Opacity(
          opacity: .5,
          child: Row(
            children: [
              Text(
                'Shipping',
                style: Style().textStyle16,
              ),
              Spacer(),
              Text(
                '\$ 9.9',
                style: Style().textStyle16,
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey.shade200,
              ),
            ],
          ),
        ),
        SizedBox(height: 5),
        Divider(
          color: Colors.grey.shade200,
        ),
        SizedBox(height: 5),
        Opacity(
          opacity: .9,
          child: Row(
            children: [
              Text(
                'Total',
                style: Style().textStyle16,
              ),
              Spacer(),
              Text(
                '\$ 99999.9',
                style: Style().textStyle16,
              ),
              SizedBox(height: 5),
              Divider(
                color: Colors.grey.shade200,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
