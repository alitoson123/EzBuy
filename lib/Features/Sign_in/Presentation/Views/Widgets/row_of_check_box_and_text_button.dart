import 'package:e_commerce_app/Core/Navigate/navigate.dart';
import 'package:e_commerce_app/Core/widgets/my_text_button.dart';
import 'package:e_commerce_app/Features/Sign_in/Presentation/Views/Widgets/my_check_box_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RowOfCheckBoxAndTextButton extends StatelessWidget {
  const RowOfCheckBoxAndTextButton(
      {super.key, required this.value, required this.onChanged});
  final bool value;
  final void Function(bool?) onChanged;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MyCheckBoxListTile(
          value: value,
          onChanged: onChanged,
        ),
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
