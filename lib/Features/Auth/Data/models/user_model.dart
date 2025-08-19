import 'package:hive/hive.dart';
import 'package:e_commerce_app/Features/Auth/Domain/Entities/user_entity.dart';

part 'user_model.g.dart';

@HiveType(typeId: 0)
class UserModel extends UserEntity with HiveObjectMixin {
  @HiveField(0)
  @override
  String? email;

  @HiveField(1)
  @override
  String? useruid;

  @HiveField(2)
  @override
  String? Fname;

  @HiveField(3)
  @override
  String? Lname;

  @HiveField(4)
  @override
  int? phoneNumber;

  @HiveField(5)
  @override
  String? address;

  @HiveField(6)
  @override
  String? imageUrl;

  UserModel({
    this.email,
    this.useruid,
    this.Fname,
    this.Lname,
    this.phoneNumber,
    this.address,
    this.imageUrl,
  }) : super(
          email: email,
          useruid: useruid,
          Fname: Fname,
          Lname: Lname,
          phoneNumber: phoneNumber,
          address: address,
          imageUrl: imageUrl,
        );

  factory UserModel.fromFirebaseAddUserOfSignUp(user) => UserModel(
        email: user.email.toString(),
        useruid: user.uid.toString(),
      );

  factory UserModel.fromFirebaseAddUserOfCompSignUpAnSignInWithGoogleAnFace(user) =>
      UserModel(
        email: user.email.toString(),
        useruid: user.uid.toString(),
        Fname: user.displayName.toString(),
        phoneNumber: user.phoneNumber,
        imageUrl: user.photoURL.toString(),
      );

  factory UserModel.fromFirebaseGetUser(Map<String, dynamic> user) => UserModel(
        email: user['email'],
        useruid: user['useruid'],
        Fname: user['Fname'],
        Lname: user['Lname'],
        phoneNumber: user['PhoneNumber'],
        address: user['Address'],
        imageUrl: user['imageUrl'],
      );


  Map<String, dynamic> toMapOfSignUp() => {
        'email': email,
        'useruid': useruid,
      };

  Map<String, dynamic> toMapOfCompSignUp() => {
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
        'imageUrl': imageUrl,
      };

  Map<String, dynamic> toMapOfSignInWithGoogleAnFacebook() => {
        'email': email,
        'useruid': useruid,
        'Fname': Fname,
        'Lname': Lname,
        'PhoneNumber': phoneNumber,
        'Address': address,
        'imageUrl': imageUrl,
      };
}
