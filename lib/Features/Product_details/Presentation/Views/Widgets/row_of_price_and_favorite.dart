import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class RowOfPriceAndFavorite extends StatelessWidget {
  const RowOfPriceAndFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$9999.9',
          style: Style()
              .textStyle18
              .copyWith(fontWeight: FontWeight.bold, color: Color(0xff343F4A)),
        ),
        CircleAvatar(
          backgroundColor: Color(0xffEDEFF1),
          child: Icon(
            Icons.favorite,
            color: Colors.red,
          ),
        )
      ],
    );
  }
}
