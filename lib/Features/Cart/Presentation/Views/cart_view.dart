import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/cart_view_body.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/number_of_items.dart';
import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Column(
          children: [
            Opacity(opacity: .7, child: Text('Your Cart')),
            Opacity(
              opacity: .5,
              child: NumberOfItems(),
            ),
          ],
        ),
      ),
      body: CartViewBody(),
    );
  }
}
