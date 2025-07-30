import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeBody(),
    Center(child: Text('Explore')),
    Center(child: Text('Profile')),
    Center(child: Text('Settings')),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        selectedIconTheme: IconThemeData(size: 28),
        selectedFontSize: 15,
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings_rounded), label: 'Settings')
        ],
        currentIndex: selectedIndex,
        onTap: onTapMethod,
      ),
      body: screens.elementAt(selectedIndex),
    );
  }

  void onTapMethod(index) {
    setState(() {
      selectedIndex = index;
    });
  }
}
