import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';

class CartItemEntity {
  final ProductEntity productEntity;
  int count;

  CartItemEntity({required this.productEntity, this.count = 1});

  num get totalPrice {
    num totalPrice = productEntity.price * count;

    return totalPrice;
  }
}
