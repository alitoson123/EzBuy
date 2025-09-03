import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class RowOfPriceAndFavorite extends StatefulWidget {
  const RowOfPriceAndFavorite({
    super.key,
    required this.product,
  });

  final ProductEntity product;

  @override
  State<RowOfPriceAndFavorite> createState() => _RowOfPriceAndFavoriteState();
}

class _RowOfPriceAndFavoriteState extends State<RowOfPriceAndFavorite> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '\$${widget.product.price}',
          style: Style()
              .textStyle18
              .copyWith(fontWeight: FontWeight.bold, color: Color(0xff343F4A)),
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              widget.product.isFavotite = !widget.product.isFavotite;
            });
          },
          child: CircleAvatar(
            backgroundColor: Color(0xffEDEFF1),
            child: Icon(
              Icons.favorite,
              color:
                  widget.product.isFavotite == true ? Colors.red : Colors.grey,
            ),
          ),
        )
      ],
    );
  }
}
