import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_item_entity.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_states.dart';
import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_elevated_button_of_product.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/the_counter_of_details_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TheFooter extends StatelessWidget {
  const TheFooter({
    super.key,
    required this.product,
  });

  final ProductEntity product;

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
        children: [
          TheCounterOfDetailsView(),
          BlocListener<CartItemCubit, CartItemStates>(
            listener: (context, state) {
              if (state is CartItemAddedSuccessfully) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Added Successfully')),
                );
              }
            },
            child: MyElevatedButtonOfProduct(
              onPressed: () {
                context.read<CartItemCubit>().addProductToCart(
                    cartItemEntity: CartItemEntity(productEntity: product),
                    myProductEntity: product);
              },
              text: 'Add to Cart',
              minimumSize: Size(290, 47),
            ),
          )
        ],
      ),
    );
  }
}
