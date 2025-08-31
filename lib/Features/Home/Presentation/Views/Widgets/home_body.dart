import 'package:e_commerce_app/Core/Services/Local_service/local_service_with_hive.dart';
import 'package:e_commerce_app/Features/Home/Presentation/View_model/Product_cubit/product_cubit.dart';
import 'package:e_commerce_app/Features/Home/Presentation/View_model/Product_cubit/product_states.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/app_bar_for_home.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/container_offer.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/list_view_of_categories.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/list_view_of_products.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({super.key});

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarForHome(),
            SizedBox(height: 20),
            ContainerOffer(),
            SizedBox(height: 20),
            Text(
              LocalServiceWithHive().getUser()?.Fname ?? 'Unknown',
              style: Style().textStyle20,
            ),
            ListViewOfCategories(),
            BlocConsumer<ProductCubit, ProductStates>(
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
            )
          ],
        ),
      ),
    );
  }
}
