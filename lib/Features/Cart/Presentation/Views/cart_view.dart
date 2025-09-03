import 'package:e_commerce_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_list_entity.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/cart_view_body.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/number_of_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartView extends StatefulWidget {
  const CartView({super.key});

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(
        getIt<CartListEntity>(),
      ),
      child: Scaffold(
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
      ),
    );
  }
}


