import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_elevated_button_of_product.dart';
import 'package:flutter/material.dart';

class TheFooterOfCart extends StatelessWidget {
  const TheFooterOfCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          //Text('Total: \$1200', style: Style().textStyle18),
          MyElevatedButtonOfProduct(
            text: 'Checkout   Total: \$1200',
            minimumSize: Size(200, 54),
          )
        ],
      ),
    );
  }
}
