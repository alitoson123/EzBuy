import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class helper {
  Future<void> goToNextPageMethod(
      {required BuildContext context,
      required int currentIndex,
      required PageController pageController}) async {
    if (currentIndex != 2) {
      pageController.animateToPage(
        currentIndex + 1,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    } else {
      GoRouter.of(context).go(Navigate.KSignInPage);
    }
  }
}
