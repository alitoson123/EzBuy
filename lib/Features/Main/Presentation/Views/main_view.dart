import 'package:e_commerce_app/Core/Services/service_locator/sevice_locator.dart';
import 'package:e_commerce_app/Features/Home/Domain/product_repo/product_repo.dart';
import 'package:e_commerce_app/Features/Home/Presentation/View_model/Product_cubit/product_cubit.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/home_body.dart';
import 'package:e_commerce_app/Features/Profile/Presentation/Views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeBody(),
    Center(child: Text('Explore')),
    Center(child: Text('Settings')),
    ProfileView(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductCubit(
        getIt<ProductRepo>(),
      ),
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 28),
          selectedFontSize: 15,
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.blue,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings_rounded), label: 'Settings'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          ],
          currentIndex: selectedIndex,
          onTap: onTapMethod,
        ),
        body: screens.elementAt(selectedIndex),
      ),
    );
  }

  void onTapMethod(index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
