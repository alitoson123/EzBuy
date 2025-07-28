import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/app_bar_for_home.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/container_offer.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/list_view_of_categories.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppBarForHome(),
            ContainerOffer(),
            SizedBox(height: 20),
            Text(
              'Category',
              style: Style().textStyle20,
            ),
            ListViewOfCategories(),
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return Container(
                    width: 190,
                    height: 220,
                    decoration: BoxDecoration(
                      color: Color(0xffECECEC),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Image.asset(
                        'assets/images/download-removebg-preview.png'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
