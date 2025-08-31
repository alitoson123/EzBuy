import 'package:e_commerce_app/Features/Home/Domain/product_repo/product_repo.dart';
import 'package:e_commerce_app/Features/Home/Presentation/View_model/Product_cubit/product_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductStates> {
  ProductCubit(this.productRepo) : super(ProductInitState());

  final ProductRepo productRepo;

  Future<void> getProducts() async {
    emit(ProductLoadingState());
    final result = await productRepo.getProducts();
    result.fold((failure) => emit(ProductFailureState(failure.errMessage)),
        (success) => emit(ProductSuccessState(success)));
  }
}
