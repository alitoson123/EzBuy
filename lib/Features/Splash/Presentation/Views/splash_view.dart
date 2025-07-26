import 'package:e_commerce_app/Core/navigate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
      (status) {
        if (status == AnimationStatus.completed) {
          GoRouter.of(context).go(Navigate.KOnBoardingPage);
        }
      },
    );
  }

  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
}
