import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/app_bar_for_home.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/container_offer.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/list_view_of_categories.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/list_view_of_products.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        //backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        //labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Settings')
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppBarForHome(),
              SizedBox(height: 20),
              ContainerOffer(),
              SizedBox(height: 20),
              Text(
                'Category',
                style: Style().textStyle20,
              ),
              ListViewOfCategories(),
              ListViewOfProducts(),
            ],
          ),
        ),
      ),
    );
  }
}
