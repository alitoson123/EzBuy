import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce_app/Features/Home/Data/Models/product_model.dart';
import 'package:e_commerce_app/Features/Home/Domain/Entities/product_enitity.dart';

class ArudData {
  /*Future<void> addUser(
      {required String documentName,
      required Map<String, dynamic> data,
      required String userUid}) async {
    var user = FirebaseFirestore.instance.collection(documentName).doc(userUid);
    user.set(
      data,
      SetOptions(merge: true),
    );
  }
*/
  Future<List<ProductEntity>> getData({required String documentName}) async {
    var data = await FirebaseFirestore.instance.collection(documentName).get();

    return data.docs.map((e) => ProductModel.fromJson(e.data())).toList();
  }


  /*Future<void> deleteUser(
      {required String documentName, required String useruid}) async {
    await FirebaseFirestore.instance
        .collection(documentName)
        .doc(useruid)
        .delete();
  }

  Future<bool> CheckIsUserAddDataBefore(
      {required String documentName, required String useruid}) async {
    var user = await FirebaseFirestore.instance
        .collection(documentName)
        .doc(useruid)
        .get();

    return user.exists;
  }*/
}
