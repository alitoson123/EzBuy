import 'package:flutter/material.dart';

class colorItem extends StatelessWidget {
  const colorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });

  final bool isSelected;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: isSelected ? 24 : 20,
      backgroundColor: Colors.black,
      child: CircleAvatar(
        radius: isSelected ? 23 : 20,
        backgroundColor: Colors.white,
        child: CircleAvatar(
          radius: 20,
          backgroundColor: color,
        ),
      ),
    );
  }
}
