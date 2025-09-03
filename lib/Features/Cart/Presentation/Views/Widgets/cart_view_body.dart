import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/list_of_carts.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/the_footer_of_cart.dart';
import 'package:flutter/material.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          ListOfCarts(),
          TheFooterOfCart(),
        ],
      ),
    );
  }
}
