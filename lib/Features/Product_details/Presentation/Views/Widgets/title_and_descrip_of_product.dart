import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TitleAndDescripOfProduct extends StatelessWidget {
  const TitleAndDescripOfProduct({super.key, required this.product});

  final ProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product.name, style: Style().textStyle20),
        const SizedBox(height: 10),
        Opacity(
          opacity: .6,
          child: ReadMoreText(product.description,
              trimLines: 2,
              trimCollapsedText: '\nSee More Details',
              trimExpandedText: '\nSee Less Details',
              moreStyle: Style().textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
              lessStyle: Style().textStyle14.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
              style: Style().textStyle14),
        ),
      ],
    );
  }
}
