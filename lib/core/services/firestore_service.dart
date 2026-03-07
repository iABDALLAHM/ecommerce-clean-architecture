import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service.dart';

class FirestoreService implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<dynamic> getData({required String path}) async {
    var data = await firestore.collection(path).get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<void> addSingleData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).doc(documentId).set(data);
  }

  @override
  Future<void> addNestedData({
    required String path,
    required String subCollection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    await firestore
        .collection(path)
        .doc(documentId)
        .collection(subCollection)
        .doc(data["code"])
        .set(data);
  }

  @override
  Future<dynamic> getSingleData({
    required String path,
    required String documentId,
  }) async {
    var data = await firestore.collection(path).doc(documentId).get();
    return data.data();
  }

  @override
  Future<dynamic> getNestedData({
    required String path,
    required String subCollection,
    required String documentId,
  }) async {
    var data = await firestore
        .collection(path)
        .doc(documentId)
        .collection(subCollection)
        .get();
    return data.docs.map((doc) => doc.data()).toList();
  }

  @override
  Future<dynamic> getQueryData({
    required String path,
    required QueryParams query,
  }) async {
    Query<Map<String, dynamic>> data = firestore.collection(path);

    for (var condition in query.conditions) {
      if (condition.isEqualTo != null) {
        data = data.where(condition.field, isEqualTo: condition.isEqualTo);
      }
      if (condition.whereIn != null) {
        data = data.where(condition.field, whereIn: condition.whereIn);
      }
      if (condition.arrayContains != null) {
        data = data.where(
          condition.field,
          arrayContains: condition.arrayContains,
        );
      }
    }

    for (var condition in query.orders) {
      data = data.orderBy(condition.field, descending: condition.descending);
    }
    var result = data.get();
    return result;
  }
}
