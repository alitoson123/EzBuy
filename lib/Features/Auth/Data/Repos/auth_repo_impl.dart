import 'package:dartz/dartz.dart';
import 'package:e_commerce_app/Core/Errors/failure.dart';
import 'package:e_commerce_app/Core/Services/ARUD_user/ARUD_user.dart';
import 'package:e_commerce_app/Core/Services/Local_service/local_service_with_hive.dart';
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
      var userData = await getUser();

      await LocalServiceWithHive().saveUser(userData);

      return right(userData);
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
      var userEntity = await UserModel.fromFirebaseAddUserOfSignUp(user);
      addUser(data: userEntity, MapOfData: userEntity.toMapOfSignUp());

      return right(UserModel.fromFirebaseAddUserOfSignUp(user));
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

      var userEntity = await UserModel
          .fromFirebaseAddUserOfCompSignUpAnSignInWithGoogleAnFace(user);

      bool isTrue =
          await CheckIsUserAddDataBefore(useruid: userEntity.useruid!);

      if (isTrue) {
        getUser();
      } else {
        addUser(
            data: userEntity,
            MapOfData: userEntity.toMapOfSignInWithGoogleAnFacebook());
      }
      return right(UserModel.fromFirebaseAddUserOfSignUp(user));
    } on FirebaseAuthException catch (e) {
      return left(Failure(errMessage: e.message.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      final user = await authObject.signInWithGoogle();

      var userEntity = await UserModel
          .fromFirebaseAddUserOfCompSignUpAnSignInWithGoogleAnFace(user);

      bool isTrue =
          await CheckIsUserAddDataBefore(useruid: userEntity.useruid!);

      if (isTrue) {
        getUser();
      } else {
        addUser(
            data: userEntity,
            MapOfData: userEntity.toMapOfSignInWithGoogleAnFacebook());
      }

      return right(UserModel.fromFirebaseAddUserOfSignUp(user));
    } on FirebaseAuthException catch (e) {
      return left(Failure(errMessage: e.message.toString()));
    }
  }

  @override
  Future<void> addUser(
      {required UserEntity data,
      required Map<String, dynamic> MapOfData}) async {
    await arudUserObject.addUser(
        documentName: "users",
        data: MapOfData,
        userUid: FirebaseAuth.instance.currentUser!.uid);
  }

  @override
  Future<UserModel> getUser() async {
    var user = await arudUserObject.getUser(
        documentName: "users", useruid: FirebaseAuth.instance.currentUser!.uid);
    return UserModel.fromFirebaseGetUser(user);
  }

  @override
  Future<void> deleteUser({required String useruid}) async {
    await arudUserObject.deleteUser(documentName: "users", useruid: useruid);
  }

  @override
  Future<bool> CheckIsUserAddDataBefore({required String useruid}) {
    return arudUserObject.CheckIsUserAddDataBefore(
        documentName: "users", useruid: useruid);
  }
}
