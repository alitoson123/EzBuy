import 'package:e_commerce_app/Features/Auth/Data/models/user_model.dart';
import 'package:e_commerce_app/constant.dart';
import 'package:hive/hive.dart';

class LocalServiceWithHive {
  final Box<UserModel> box = Hive.box<UserModel>(KUserBox);

  Future<void> saveUser(UserModel user) async {
    await box.put(currentUser, user);
  }

  UserModel? getUser() {
    return box.get(currentUser);
  }

  Future<void> deleteUser() async {
    await box.delete(currentUser);
  }
}
