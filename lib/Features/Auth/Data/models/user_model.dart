import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    super.email,
    super.useruid,
    super.Fname,
    super.Lname,
    super.phoneNumber,
    super.address,
    super.imageUrl,
  });

  factory UserModel.fromFirebaseAddUserOfSignUp(user) => UserModel(
        email: user.email.toString(),
        useruid: user.uid.toString(),
      );
  factory UserModel.fromFirebaseAddUserOfCompSignUpAnSignInWithGoogleAnFace(
          user) =>
      UserModel(
        email: user.email.toString(),
        useruid: user.uid.toString(),
        Fname: user.displayName.toString(),
        phoneNumber: user.phoneNumber,
        imageUrl: user.photoURL.toString(),
      );

  factory UserModel.fromFirebaseGetUser(user) => UserModel(
        email: user['email'],
        useruid: user['useruid'],
        Fname: user['Fname'],
        Lname: user['Lname'],
        phoneNumber: user['PhoneNumber'],
        address: user['Address'],
        imageUrl: user['imageUrl'],
      );
}
