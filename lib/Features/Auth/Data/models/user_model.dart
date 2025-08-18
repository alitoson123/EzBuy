import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel(
      {super.email,
      super.useruid,
      super.Fname,
      super.Lname,
      super.phoneNumber,
      super.address});

  factory UserModel.fromFirebaseAddUser(user) => UserModel(
        email: user.email.toString(),
        useruid: user.uid.toString(),
      );
  factory UserModel.fromFirebaseAddUser2(user) => UserModel(
        email: user.email.toString(),
        useruid: user.uid.toString(),
        Fname: user.displayName.toString(),
        phoneNumber: user.phoneNumber,
      );

  factory UserModel.fromFirebaseGetUser(user) => UserModel(
        email: user['email'],
        useruid: user['useruid'],
        Fname: user['Fname'],
        Lname: user['Lname'],
        phoneNumber: user['PhoneNumber'],
        address: user['Address'],
      );
}
