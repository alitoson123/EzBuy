import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/first_container_of_dismissible.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/product_item_of_cart_view.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/second_container_of_dismissible.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfCarts extends StatefulWidget {
  const ListOfCarts({super.key});

  @override
  State<ListOfCarts> createState() => _ListOfCartsState();
}

class _ListOfCartsState extends State<ListOfCarts> {
  @override
  Widget build(BuildContext context) {
    final cartListEntity = context.watch<CartItemCubit>().cartListEntity;
    final cartItems = cartListEntity.cartItemsList;
    return Expanded(
      child: ListView.builder(
        itemCount: cartItems.length,
        itemBuilder: (context, index) => Dismissible(
            key: ValueKey(cartItems[index]),
            background: FirstContainerOfDismissible(),
            secondaryBackground: SecondContainerOfDismissible(),
            onDismissed: (DismissDirection direction) {
              setState(() {
                cartItems.removeAt(index);
              });
            },
            child: ProductItemOfCartView(
              cartItemEntity: cartItems[index],
            )),
      ),
    );
  }
}
