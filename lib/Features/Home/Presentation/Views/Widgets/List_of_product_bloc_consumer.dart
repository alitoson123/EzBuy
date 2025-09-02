import 'package:e_commerce_app/Features/Home/Presentation/View_model/Product_cubit/product_cubit.dart';
import 'package:e_commerce_app/Features/Home/Presentation/View_model/Product_cubit/product_states.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/list_view_of_products.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListOfProductsBlocConsumer extends StatelessWidget {
  const ListOfProductsBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductStates>(
      listener: (context, state) {
        if (state is ProductFailureState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errMessage)),
          );
        }
      },
      builder: (context, state) {
        if (state is ProductSuccessState) {
          return ListViewOfProducts(products: state.products);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
