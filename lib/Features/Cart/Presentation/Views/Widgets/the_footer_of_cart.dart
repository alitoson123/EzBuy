import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_elevated_button_of_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
            onPressed: () {
              GoRouter.of(context).push(Navigate.KCheckOutPage);
            },
            text:
                'Checkout   Total: \$ ${context.watch<CartItemCubit>().cartListEntity.totalCost}',
            minimumSize: Size(200, 54),
          )
        ],
      ),
    );
  }
}
