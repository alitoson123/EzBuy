import 'dart:io';
import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';

class ProductModel extends ProductEntity {
  @override
  final String name;
  @override
  final num price;
  //final Color color;
  @override
  final String code;
  @override
  final String description;
  @override
  final String category;
  @override
  bool isFavotite;
  @override
  final File? image;
  @override
  String? imageUrl;

  ProductModel({
    required this.name,
    required this.price,
    required this.code,
    required this.description,
    required this.category,
    required this.isFavotite,
    this.image,
    this.imageUrl,
  }) : super(
          name: name,
          price: price,
          code: code,
          description: description,
          category: category,
          isFavotite: isFavotite,
          image: image,
          imageUrl: imageUrl,
        );

  factory ProductModel.fromEntity(ProductEntity addProductEntity) {
    return ProductModel(
      name: addProductEntity.name,
      price: addProductEntity.price,
      code: addProductEntity.code,
      description: addProductEntity.description,
      category: addProductEntity.category,
      isFavotite: addProductEntity.isFavotite,
      image: addProductEntity.image,
      imageUrl: addProductEntity.imageUrl,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      name: json['name'],
      price: json['price'],
      code: json['code'],
      description: json['description'],
      category: json['category'],
      isFavotite: json['isFavotite'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'code': code,
      'description': description,
      'category': category,
      'isFavotite': isFavotite,
      'imageUrl': imageUrl,
    };
  }
}
