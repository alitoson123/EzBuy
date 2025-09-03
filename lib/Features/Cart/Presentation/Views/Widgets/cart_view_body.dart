import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_states.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/list_of_carts.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/the_footer_of_cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: BlocBuilder<CartItemCubit, CartItemStates>(
        builder: (context, state) {
          return Column(
            children: [
              ListOfCarts(),
              TheFooterOfCart(),
            ],
          );
        },
      ),
    );
  }
}
