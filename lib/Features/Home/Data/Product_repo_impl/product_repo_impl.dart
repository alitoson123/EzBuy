import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Core/Services/ARUD_data/ARUD_data.dart';
import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';
import 'package:e_commerce_app/Features/Home/Domain/product_repo/product_repo.dart';

class ProductRepoImpl extends ProductRepo {
  final ArudData arudData;

  ProductRepoImpl({required this.arudData});
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      List<ProductEntity> products =
          await arudData.getData(documentName: "products");

      return right(products);
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }
}
