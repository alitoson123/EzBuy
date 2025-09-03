import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/app_bar_of_cart.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/cart_view_body.dart';
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
      appBar: appBarOfCart(),
      body: CartViewBody(),
    );
  }
}
