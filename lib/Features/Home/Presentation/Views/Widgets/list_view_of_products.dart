import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/product_item.dart';
import 'package:flutter/material.dart';

class ListViewOfProducts extends StatelessWidget {
  const ListViewOfProducts({super.key, required this.products});

  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: products.length,
      padding: EdgeInsets.only(top: 10),
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 255,
      ),
      itemBuilder: (context, index) {
        return ProductItem(
          product: products[index],
        );
      },
    );
  }
}
