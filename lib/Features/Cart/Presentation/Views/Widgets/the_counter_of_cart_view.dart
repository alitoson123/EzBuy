import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_item_entity.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class TheCounterOfCartView extends StatefulWidget {
  const TheCounterOfCartView({
    super.key,
    required this.cartItemEntity,
  });
  final CartItemEntity cartItemEntity;

  @override
  State<TheCounterOfCartView> createState() => _TheCounterOfCartViewState();
}

class _TheCounterOfCartViewState extends State<TheCounterOfCartView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 105,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              if (widget.cartItemEntity.count > 1) {
                setState(() {
                  widget.cartItemEntity.count--;
                });
              }
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: const Color.fromARGB(101, 158, 158, 158),
              child: Icon(
                Icons.remove,
                size: 22,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(width: 5),
          Text(
            widget.cartItemEntity.count.toString(),
            style: Style()
                .textStyle18
                .copyWith(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              setState(() {
                widget.cartItemEntity.count++;
              });
            },
            child: CircleAvatar(
              radius: 14,
              backgroundColor: Colors.black,
              child: Icon(
                Icons.add,
                size: 22,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
