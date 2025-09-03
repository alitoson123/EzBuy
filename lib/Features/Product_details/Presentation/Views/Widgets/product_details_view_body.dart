import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/container_of_product_details.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/container_of_product_image.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/the_footer.dart';
import 'package:flutter/material.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffEDEFF1),
      child: Column(
        children: [
          ContainerOfProductImage(
            productImage: product.imageUrl ??
                'assets/images/download-removebg-preview.png',
          ),
          ContainerOfProductDetails(
            product: product,
          ),
          Container(
            color: Colors.white,
            child: TheFooter(
              product: product,
            ),
          ),
        ],
      ),
    );
  }
}
