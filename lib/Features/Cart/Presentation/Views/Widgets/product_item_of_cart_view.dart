import 'package:e_commerce_app/Features/Cart/Presentation/Views/Widgets/the_counter_of_cart_view.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class ProductItemOfCartView extends StatelessWidget {
  const ProductItemOfCartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Container(
            width: 110,
            height: 100,
            decoration: BoxDecoration(
              color: Color(0xffECECEC),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Image.asset(
              'assets/images/download-removebg-preview.png',
            ),
          ),
          SizedBox(width: 10),
          Padding(
            padding: const EdgeInsets.only(left: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                  opacity: .6,
                  child: Text(
                    'MacBook Air',
                    style:
                        Style().textStyle20.copyWith(color: Color(0xff343F4A)),
                  ),
                ),
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '\$9999.9',
                      style: Style().textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff343F4A)),
                    ),
                    SizedBox(width: 85),
                    TheCounterOfCartView(),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
