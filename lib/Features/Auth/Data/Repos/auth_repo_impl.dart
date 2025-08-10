import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Core/Services/firebase_auth_service/firebase_auth.dart';
import 'package:e_commerce_app/Features/Auth/Data/models/user_model.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Repos/auth_repo.dart';

class AuthRepoImpl extends AuthRepo {
  @override
  final Auth authObject;

  AuthRepoImpl({required this.authObject});
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword(
    context, {
    required String email,
    required String password,
    required bool isSelected,
  }) async {
    try {
      var user = await authObject.SignInWithEmailAndPAsswordAndIsLoginCheck(
          context,
          email: email,
          password: password,
          isSelected: isSelected);

      return right(UserModel.fromFirebaseUser(user));
    }  catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup(context,
      {required String email,
      required String password,
      required bool isSelected}) async {
    try {
      var user = await authObject.SignUpMethod(context,
          isSelected: isSelected, email: email, password: password);

      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<UserEntity> forgetPassword({required String email}) {
    // TODO: implement forgetPassword

    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<UserEntity> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }
}
