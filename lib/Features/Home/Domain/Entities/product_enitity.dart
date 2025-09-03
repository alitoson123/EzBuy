//import 'package:flutter/material.dart';

import 'dart:io';

class ProductEntity {
  final String name;
  final num price;
  //final Color color;
  final String code;
  final String description;
  final String category;
  bool isFavotite;
  final File? image;
  String? imageUrl;

  ProductEntity(
      {required this.name,
      required this.price,
      // required this.color,
      required this.code,
      required this.description,
      required this.category,
      required this.isFavotite,
      required this.image,
      this.imageUrl});
}
