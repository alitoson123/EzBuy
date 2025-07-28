import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/my_circle_avatar.dart';
import 'package:e_commerce_app/Features/Home/Presentation/Views/Widgets/text_field_for_home.dart';
import 'package:flutter/material.dart';

class AppBarForHome extends StatelessWidget {
  const AppBarForHome({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          Expanded(child: TextFieldForHome()),
          SizedBox(width: 10),
          MyCircleAvatar(
            icon: Icons.shopping_cart_outlined,
          ),
          SizedBox(width: 12),
          MyCircleAvatar(
            icon: Icons.notifications_none,
          ),
        ],
      ),
    );
  }
}
