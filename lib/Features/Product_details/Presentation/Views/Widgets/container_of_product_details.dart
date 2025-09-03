import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/list_view_of_colors.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/row_of_price_and_favorite.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/title_and_descrip_of_product.dart';
import 'package:flutter/material.dart';

class ContainerOfProductDetails extends StatelessWidget {
  const ContainerOfProductDetails({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: SizedBox(
          height: 265,
          child: ListView(
            children: [
              TitleAndDescripOfProduct(
                product: product,
              ),
              SizedBox(
                height: 10,
              ),
              RowOfPriceAndFavorite(
                product: product,
              ),
              ListViewOfColors(),
            ],
          ),
        ),
      ),
    );
  }
}
