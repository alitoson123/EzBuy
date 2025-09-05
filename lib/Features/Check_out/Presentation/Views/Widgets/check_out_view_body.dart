import 'package:e_commerce_app/Core/widgets/myElevated_button.dart';
import 'package:e_commerce_app/Features/Check_out/Presentation/Views/Widgets/address_of_check_out.dart';
import 'package:e_commerce_app/Features/Check_out/Presentation/Views/Widgets/list_of_hor_cart_of_check_out.dart';
import 'package:e_commerce_app/Features/Check_out/Presentation/Views/Widgets/order_summary_check_out.dart';
import 'package:e_commerce_app/Features/Check_out/Presentation/Views/Widgets/payment_methods_of_check_out.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class CheckOutViewBody extends StatelessWidget {
  const CheckOutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your cart',
            style: Style().textStyle20,
          ),
          SizedBox(height: 15),
          ListOfHorCartOfCheckOut(),
          SizedBox(height: 15),
          AddressOfCheckOut(),
          SizedBox(height: 15),
          PaymentMethodsOfCheckOut(),
          SizedBox(height: 15),
          OrderSummaryCheckOut(),
          SizedBox(
            height: 25,
          ),
          Center(
            child: MyelevatedButton(
              onPressed: () {},
              text: 'Pay Now',
            ),
          )
        ],
      ),
    );
  }
}
