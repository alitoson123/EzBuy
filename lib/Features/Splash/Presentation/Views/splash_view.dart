import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationMethod();
    controller.forward();
    navigateMethod();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFDFC),
      body: Center(
        child: FadeTransition(
            opacity: controller,
            child: Image.asset(
                'assets/Logo/ChatGPT Image Jul 17, 2025, 02_05_58 PM.png')),
      ),
    );
  }

  void animationMethod() {
    controller =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    animation = Tween(begin: 1, end: 5).animate(controller);
  }

  void navigateMethod() {
    controller.addStatusListener(
      (status) async {
        if (status == AnimationStatus.completed) {
          SharedPreferences prefs = await SharedPreferences.getInstance();
          bool isRemembered = prefs.getBool('isRemembered') ?? false;

          if (isRemembered) {
            GoRouter.of(context).go(Navigate.KHomePage);
          } else {
            GoRouter.of(context).go(Navigate.KOnBoardingPage);
          }
        }
      },
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
