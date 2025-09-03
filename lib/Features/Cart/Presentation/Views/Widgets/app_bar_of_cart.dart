import 'package:e_commerce_app/constant.dart';
import 'package:flutter/material.dart';

AppBar appBarOfCart() {
  return AppBar(
    centerTitle: true,
    title: Column(
      children: [
        Opacity(opacity: .7, child: Text('Your Cart')),
        Opacity(
          opacity: .5,
          child: Text(
            '3 items',
            style: Style().textStyle16,
          ),
        ),
      ],
    ),
  );
}
