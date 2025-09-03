import 'package:e_commerce_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_list_entity.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_cubit.dart';
import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_app_bar.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/product_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartItemCubit(
        getIt<CartListEntity>(),
      ),
      child: Scaffold(
          appBar: MyAppBar(), body: ProductDetailsViewBody(product: product)),
    );
  }
}
