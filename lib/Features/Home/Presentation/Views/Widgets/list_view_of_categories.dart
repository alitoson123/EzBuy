import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/category_item.dart';
import 'package:flutter/material.dart';

class ListViewOfCategories extends StatelessWidget {
  const ListViewOfCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return CategoryItem();
        },
      ),
    );
  }
}
