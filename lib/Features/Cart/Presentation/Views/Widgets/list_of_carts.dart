import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/first_container_of_dismissible.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/product_item_of_cart_view.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/second_container_of_dismissible.dart';
import 'package:flutter/material.dart';

class ListOfCarts extends StatefulWidget {
  const ListOfCarts({super.key});

  @override
  State<ListOfCarts> createState() => _ListOfCartsState();
}

class _ListOfCartsState extends State<ListOfCarts> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 3,
        itemBuilder: (context, index) => Dismissible(
            key: UniqueKey(),
            background: FirstContainerOfDismissible(),
            secondaryBackground: SecondContainerOfDismissible(),
            onDismissed: (DismissDirection direction) {
              setState(() {
                // cartItems.removeAt(index);
              });
            },
            child: ProductItemOfCartView()),
      ),
    );
  }
}
