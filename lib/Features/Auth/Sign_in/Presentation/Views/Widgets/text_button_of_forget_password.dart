import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/widgets/my_text_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class TextButtonOfForgetPassword extends StatelessWidget {
  const TextButtonOfForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyTextButton(
          myText: 'Forgot Password?',
          onPressed: () {
            GoRouter.of(context).push(Navigate.KForgetPasswordPage);
          },
        ),
      ],
    );
  }
}
