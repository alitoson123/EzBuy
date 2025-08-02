import 'package:e_commerce_app/Features/Product_details/Presentation/Views/Widgets/color_item.dart';
import 'package:flutter/material.dart';

class ListViewOfColors extends StatefulWidget {
  const ListViewOfColors({super.key});

  @override
  State<ListViewOfColors> createState() => _ListViewOfColorsState();
}

class _ListViewOfColorsState extends State<ListViewOfColors> {
  List<Color> colorsList = [
    Colors.black,
    Colors.purple,
    Colors.blue,
    Colors.red,
  ];

  int isSelected = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: colorsList.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(4),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isSelected = index;
                });
              },
              child: colorItem(
                  isSelected: isSelected == index, color: colorsList[index]),
            ),
          );
        },
      ),
    );
  }
}
