import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

class TextOfTitleAndSubtitle extends StatelessWidget {
  const TextOfTitleAndSubtitle(
      {super.key, required this.title, required this.subtitle});
  final String title;
  final String subtitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(title, style: Style().textStyle28),
        Opacity(
          opacity: .6,
          child: Text(
            subtitle,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
