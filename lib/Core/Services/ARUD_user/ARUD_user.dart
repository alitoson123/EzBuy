import 'package:cloud_firestore/cloud_firestore.dart';

class ArudUser {
  Future<void> addUser(
      {required String documentName,
      required Map<String, dynamic> data,
      required String useruid}) async {
    var users =
        FirebaseFirestore.instance.collection(documentName).doc(useruid);
    users.set(
      data,
      SetOptions(merge: true),
    );
  }
}
