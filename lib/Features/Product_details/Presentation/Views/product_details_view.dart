import 'dart:ffi';

import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEDEFF1),
      appBar: AppBar(
        backgroundColor: Color(0xffEDEFF1),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: 70,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      '4.5',
                      style: Style().textStyle16.copyWith(color: Colors.black),
                    ),
                    Icon(
                      Icons.star,
                      color: Color(0xffEEBD24),
                      size: 22,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                color: Color(0xffEDEFF1),
                // borderRadius: BorderRadius.circular(15),
              ),
              child: Image.asset('assets/images/download-removebg-preview.png'),
            ),
          ),
          Container(
            width: double.infinity,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(20),
            ),
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
                Text(
                  'The latest MacBook Air (M4, 2025) is available in 13.6-inch and 15.3-inch Liquid Retina displays with 500 nits brightness, P3 wide color, and True Tone. Powered by the Apple M4 chip featuring a 10-core CPU and up to a 10-core GPU, it includes a 16-core Neural Engine for enhanced AI performance. It starts with 16 GB of unified memory (configurable up to 32 GB) and SSD storage ranging from 256 GB to 2 TB. Battery life is excellent—up to 18 hours for the 13-inch model and 20 hours for the 15-inch. It features a 12 MP front camera with Center Stage and Desk View, Spatial Audio with a 4- or 6-speaker system depending on size, and a 3-mic array. Connectivity includes MagSafe 3 charging, two Thunderbolt/USB 4 ports, and a 3.5 mm headphone jack. It ships in four colors—Midnight, Silver, Starlight, and Sky Blue—with a fanless, lightweight design and support for dual 6K external displays.',
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Style().textStyle16.copyWith(color: Color(0xff343F4A))
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$9999.9',
                      style: Style().textStyle18.copyWith(
                          fontWeight: FontWeight.bold,
                          color: Color(0xff343F4A)),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.favorite,
                        color: Colors.red,
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
