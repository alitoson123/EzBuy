import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Core/Models/data_model.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signup({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> forgetPassword({
    required String email,
  });
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();

  Future<void> addUser(
      {required UserEntity user, required Map<String, dynamic> data});
  Future<void> addUser2({required DataModel user});
  //Future<void> addUser3({required UserEntity user});
  Future<UserEntity> getUser();
}
