import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_item_entity.dart';
import 'package:e_commerce_app/Features/Cart/Domain/Entities/cart_list_entity.dart';
import 'package:e_commerce_app/Features/Cart/Presentation/View_model/cart_item_cubit.dart/cart_item_states.dart';
import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartItemCubit extends Cubit<CartItemStates> {
  CartItemCubit(this.cartListEntity) : super(CartItemInitialState());

  final CartListEntity cartListEntity;

  Future<void> addProductToCart({
    required CartItemEntity cartItemEntity,
    required ProductEntity myProductEntity,
  }) async {
    try {
      // Look for existing product in cart
      final index = cartListEntity.cartItemsList.indexWhere(
        (item) => item.productEntity.code == myProductEntity.code,
      );

      if (index != -1) {
        // Product already exists -> increase count
        cartListEntity.cartItemsList[index].count++;
      } else {
        // Product not in cart -> add it
        cartListEntity.cartItemsList.add(cartItemEntity);
      }

      emit(CartItemAddedSuccessfully());
    } catch (e) {
      emit(CartItemAddedfailed(errMessage: e.toString()));
    }
  }
}
