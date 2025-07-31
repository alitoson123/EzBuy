import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class ProductDetailsView extends StatefulWidget {
  const ProductDetailsView({super.key});

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {
  List<Color> colorsList = [
    Colors.black,
    Colors.purple,
    Colors.blue,
    Colors.red,
  ];
  int isSelected = 0;
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
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(14),
              child: Expanded(
                child: ListView(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('MacBook Air', style: Style().textStyle20),
                    const SizedBox(height: 10),
                    Opacity(
                      opacity: .6,
                      child: ReadMoreText(
                          'The latest MacBook Air (M4, 2025) is available in 13.6-inch and 15.3-inch Liquid Retina displays with 500 nits brightness, P3 wide color, and True Tone. Powered by the Apple M4 chip featuring a 10-core CPU and up to a 10-core GPU, it includes a 16-core Neural Engine for enhanced AI performance. It starts with 16 GB of unified memory (configurable up to 32 GB) and SSD storage ranging from 256 GB to 2 TB.',
                          trimLines: 2,
                          trimCollapsedText: '\nSee More Details >',
                          trimExpandedText: '\nSee Less Details <',
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
                    SizedBox(
                      height: 10,
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
                    SizedBox(
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
                              child: CircleAvatar(
                                radius: isSelected == index ? 24 : 20,
                                backgroundColor: Colors.black,
                                child: CircleAvatar(
                                  radius: isSelected == index ? 23 : 20,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: colorsList[index],
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 40,
                width: 105,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: const Color.fromARGB(101, 158, 158, 158),
                      child: Icon(
                        Icons.remove,
                        size: 28,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      '1',
                      style: Style().textStyle20.copyWith(
                          color: Colors.black, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 5),
                    CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.add,
                        size: 28,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Add to Cart',
                  style: Style().textStyle20.copyWith(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xff1E88E5),
                    minimumSize: Size(290, 47)),
              )
            ],
          )
        ],
      ),
    );
  }
}
