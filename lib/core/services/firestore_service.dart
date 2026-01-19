import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
    bool? isNestedData,
    String? subCollection,
  }) async {
    if (isNestedData == true) {
      await firestore
          .collection(path)
          .doc(documentId)
          .collection(subCollection!)
          .doc(data["code"])
          .set(data);
    } else if (documentId != null) {
      await firestore.collection(path).doc(documentId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<dynamic> getData({
    required String path,
    String? documentId,
    bool? isNestedData,
    Map<String, dynamic>? query,
    String? subCollection,
  }) async {
    if (isNestedData == true) {
      var data = await firestore
          .collection(path)
          .doc(documentId)
          .collection(subCollection!)
          .get();
      return data.docs.map((doc) => doc.data()).toList();
    } else if (documentId != null) {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } else {
      var data = await firestore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    }
  }
}
