import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';

class FirestoreService implements DatabaseService {
  final FirebaseFirestore firestore;
  FirestoreService({required this.firestore});
  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(path).add(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء إضافة البيانات، حاول مرة أخرى",
      );
    }
  }

  @override
  Future<dynamic> getData({required String path}) async {
    try {
      var data = await firestore.collection(path).get();
      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "تعذر تحميل البيانات، تحقق من الاتصال بالإنترنت",
      );
    }
  }

  @override
  Future<void> addSingleData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore.collection(path).doc(documentId).set(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء إضافة البيانات، حاول مرة أخرى",
      );
    }
  }

  @override
  Future<void> addNestedData({
    required String path,
    required String subCollection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore
          .collection(path)
          .doc(documentId)
          .collection(subCollection)
          .doc(data["productCode"])
          .set(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء إضافة البيانات، حاول مرة أخرى",
      );
    }
  }

  @override
  Future<dynamic> getSingleData({
    required String path,
    required String documentId,
  }) async {
    try {
      var data = await firestore.collection(path).doc(documentId).get();
      return data.data();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "تعذر العثور على البيانات المطلوبة",
      );
    }
  }

  @override
  Future<dynamic> getNestedData({
    required String path,
    required String subCollection,
    required String documentId,
  }) async {
    try {
      var data = await firestore
          .collection(path)
          .doc(documentId)
          .collection(subCollection)
          .get();
      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(exceptionMeassge: "تعذر تحميل البيانات المرتبطة");
    }
  }

  @override
  Future<dynamic> getQueryData({
    required String path,
    required QueryParams query,
  }) async {
    try {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      var condition = query.condition;
      if (condition != null) {
        data = data.where(condition.field, isEqualTo: condition.isEqualTo);
      }
      if (condition != null) {
        data = data.where(condition.field, whereIn: condition.whereIn);
      }
      if (condition != null) {
        data = data.where(
          condition.field,
          arrayContains: condition.arrayContains,
        );
      }

      var order = query.order;

      if (order != null) {
        data = data.orderBy(order.field, descending: order.descending);
      }

      var result = await data.get();
      return result.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء البحث عن البيانات",
      );
    }
  }

  @override
  Future<void> removeNestedData({
    required String path,
    required String subCollection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore
          .collection(path)
          .doc(documentId)
          .collection(subCollection)
          .doc(data["productCode"])
          .delete();
    } catch (e) {
      throw CustomException(exceptionMeassge: "تعذر حذف البيانات");
    }
  }

  @override
  Future<void> addSubCollectionData({
    required String path,
    required String subCollection,
    required String documentId,
    required Map<String, dynamic> data,
  }) async {
    try {
      await firestore
          .collection(path)
          .doc(documentId)
          .collection(subCollection)
          .add(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ أثناء إضافة البيانات، حاول مرة أخرى",
      );
    }
  }

  @override
  Future<void> updateDate({
    required Map<String, dynamic> data,
    required String path,
    required String documentId,
  }) async {
    try {
      await firestore.collection(path).doc(documentId).update(data);
    } catch (e) {
      throw CustomException(
        exceptionMeassge: "حدث خطأ ما اثناء تحديث البيانات",
      );
    }
  }

  @override
  Stream<dynamic> getQueryStreamData({
    required String path,
    required QueryParams query,
  }) {
    try {
      Query<Map<String, dynamic>> data = firestore.collection(path);

      var condition = query.condition;
      if (condition != null) {
        data = data.where(condition.field, isEqualTo: condition.isEqualTo);
      }
      if (condition != null) {
        data = data.where(condition.field, whereIn: condition.whereIn);
      }
      if (condition != null) {
        data = data.where(
          condition.field,
          arrayContains: condition.arrayContains,
        );
      }

      var order = query.order;
      if (order != null) {
        data = data.orderBy(order.field, descending: order.descending);
      }

      var result = data.snapshots();
      return result.map((snapshot) { // صورة كاملة من البيانات في الوقت ده !
        return snapshot.docs.map((doc) => doc.data()).toList(); // باخد الصورة والف على البيانات الي فيها
      });
    } catch (e) {
      throw CustomException(exceptionMeassge: "حدث خطأ اثناء جلب البيانات");
    }
  }
}
