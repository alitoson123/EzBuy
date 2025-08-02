import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/container_of_product_details.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/container_of_product_image.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/my_app_bar.dart';
import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/the_footer.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: Container(
        color: Color(0xffEDEFF1),
        child: Column(
          children: [
            ContainerOfProductImage(),
            ContainerOfProductDetails(),
            Container(color: Colors.white, child: TheFooter()),
          ],
        ),
      ),
    );
  }
}
