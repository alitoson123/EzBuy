import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class TitleAndDescripOfProduct extends StatelessWidget {
  const TitleAndDescripOfProduct({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('MacBook Air', style: Style().textStyle20),
        const SizedBox(height: 10),
        Opacity(
          opacity: .6,
          child: ReadMoreText(
              'The latest MacBook Air (M4, 2025) is available in 13.6-inch and 15.3-inch Liquid Retina displays with 500 nits brightness, P3 wide color, and True Tone. Powered by the Apple M4 chip featuring a 10-core CPU and up to a 10-core GPU, it includes a 16-core Neural Engine for enhanced AI performance. It starts with 16 GB of unified memory (configurable up to 32 GB) and SSD storage ranging from 256 GB to 2 TB.',
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
