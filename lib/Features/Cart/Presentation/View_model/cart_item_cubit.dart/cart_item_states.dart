class CartItemStates {}

class CartItemInitialState extends CartItemStates {}

class CartItemAddedSuccessfully extends CartItemStates {}

class CartItemAddedfailed extends CartItemStates {
  final String errMessage;

  CartItemAddedfailed({required this.errMessage});
}

class CartItemRemovedSuccessfully extends CartItemStates {}

class CartItemRemovedfailed extends CartItemStates {
  final String errMessage;
  CartItemRemovedfailed({required this.errMessage});
}
