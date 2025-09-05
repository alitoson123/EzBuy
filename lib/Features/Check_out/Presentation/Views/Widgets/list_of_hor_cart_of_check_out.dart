import 'package:e_commerce_app/Features/Check_out/Presentation/Views/Widgets/cart_item_of_check_out.dart';
import 'package:flutter/material.dart';

class ListOfHorCartOfCheckOut extends StatelessWidget {
  const ListOfHorCartOfCheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        itemBuilder: (context, index) {
          return CartItemOfCheckOut(index: index);
        },
      ),
    );
  }
}
