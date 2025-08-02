import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: Color(0xffEDEFF1),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 70,
            height: 30,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    '4.5',
                    style: Style().textStyle16.copyWith(color: Colors.black),
                  ),
                  Icon(
                    Icons.star,
                    color: Color(0xffEEBD24),
                    size: 22,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
