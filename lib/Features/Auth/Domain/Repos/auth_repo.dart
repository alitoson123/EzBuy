import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    context, {
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> signup(
    context, {
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> forgetPassword({
    required String email,
  });
  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
}
