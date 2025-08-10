import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {required super.email,
      required super.name,
      required super.PhoneNumber,
      required super.useruid});

  factory UserModel.fromFirebaseUser(user) => UserModel(
        email: user.email.toString(),
        name: user.displayName.toString(),
        PhoneNumber: user.phoneNumber.toString(),
        useruid: user.uid.toString(),
      );
}
