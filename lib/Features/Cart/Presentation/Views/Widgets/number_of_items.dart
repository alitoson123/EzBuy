import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NumberOfItems extends StatelessWidget {
  const NumberOfItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '${context.watch<CartItemCubit>().cartListEntity.cartItemsList.length.toString()} items',
      style: Style().textStyle16,
    );
  }
}
