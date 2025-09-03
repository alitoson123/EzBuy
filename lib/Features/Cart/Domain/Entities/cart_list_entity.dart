import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_item_entity.dart';

class CartListEntity {
  final List<CartItemEntity> cartItemsList;

  CartListEntity({required this.cartItemsList});

  num get totalCost {
    num sum = 0;
    for (var item in cartItemsList) {
      sum += item.totalPrice;
    }
    return sum;
  }
}
