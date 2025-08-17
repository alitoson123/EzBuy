import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Core/Models/data_model.dart';
import 'package:e_commerce_app/Core/Services/ARUD_user/ARUD_user.dart';
import 'package:e_commerce_app/Core/Services/firebase_auth_service/firebase_auth_service.dart';
import 'package:e_commerce_app/Features/Auth/Data/models/user_model.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Repos/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthRepoImpl extends AuthRepo {
  final Auth authObject;
  final ArudUser arudUserObject;

  AuthRepoImpl({required this.arudUserObject, required this.authObject});
  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authObject.signInWithEmailAndPasswordAndIsLoginCheck(
        email: email,
        password: password,
      );
      addUser(user: UserModel.fromFirebaseUser(user));
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      return left(Failure(errMessage: errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signup({
    required String email,
    required String password,
  }) async {
    try {
      var user =
          await authObject.SignUpMethod(email: email, password: password);
      addUser(user: UserModel.fromFirebaseUser(user));

      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      final errorMessage = e.toString().replaceFirst('Exception: ', '');
      return left(Failure(errMessage: errorMessage));
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      var user = await authObject.ForgetPasswordMethod(email: email);
      return right(user);
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      final user = await authObject.signInWithFacebook();

      addUser(user: UserModel.fromFirebaseUser(user));

      return right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return left(Failure(errMessage: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await authObject.signInWithGoogle();

      addUser(user: UserModel.fromFirebaseUser(user));

      return right(UserModel.fromFirebaseUser(user));
    } on FirebaseAuthException catch (e) {
      return left(Failure(errMessage: e.message.toString()));
    }
  }

  @override
  Future<void> addUser({required UserEntity user}) async {
    await arudUserObject.addUser(
        documentName: "users",
        data: user.toMap(),
        useruid: FirebaseAuth.instance.currentUser!.uid);
  }

  Future<void> addUser2({required DataModel user}) async {
    await arudUserObject.addUser(
        documentName: "users",
        data: user.toMap(),
        useruid: FirebaseAuth.instance.currentUser!.uid);
  }
}
