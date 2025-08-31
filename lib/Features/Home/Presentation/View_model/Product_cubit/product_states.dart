import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';

class ProductStates {}

class ProductInitState extends ProductStates {}

class ProductLoadingState extends ProductStates {}

class ProductSuccessState extends ProductStates {
  final List<ProductEntity> products;
  ProductSuccessState(this.products);
}

class ProductFailureState extends ProductStates {
  final String errMessage;
  ProductFailureState(this.errMessage);
}
