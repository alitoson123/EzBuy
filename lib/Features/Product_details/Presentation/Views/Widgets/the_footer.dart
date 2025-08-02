import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_elevated_button_of_product.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/the_counter.dart';
import 'package:flutter/material.dart';

class TheFooter extends StatelessWidget {
  const TheFooter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 103,
      decoration: BoxDecoration(
        color: Color(0xffEDEFF1),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [TheCounter(), MyElevatedButtonOfProduct()],
      ),
    );
  }
}
