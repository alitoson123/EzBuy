import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowOfDontHaveAnAccountAndSignUp extends StatelessWidget {
  const RowOfDontHaveAnAccountAndSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Don\'t have an account? ',
          style: Style().textStyle16,
        ),
        GestureDetector(
          onTap: () {
            GoRouter.of(context).go(Navigate.KSignUpPage);
          },
          child: Text(
            'Sign Up',
            style: Style().textStyle16.copyWith(color: KPrimaryColor),
          ),
        ),
      ],
    );
  }
}
