import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        child: Container(
          width: 65,
          decoration: BoxDecoration(
            color: Color(0xffECECEC),
            borderRadius: BorderRadius.circular(25),
          ),
          child: Center(
            child: Text(
              'All',
              style: Style().textStyle18,
            ),
          ),
        ),
      ),
    );
  }
}
