import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:ecommerce_clean_architecture/core/errors/custom_exception.dart';
import 'package:ecommerce_clean_architecture/core/models/query_params.dart';
import 'package:ecommerce_clean_architecture/core/services/database_service/database_service.dart';
import 'package:ecommerce_clean_architecture/generated/locale_keys.g.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DatabaseService)
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
        exceptionMeassge: LocaleKeys.errors_database_addDataError.tr(),
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
        exceptionMeassge: LocaleKeys.errors_database_getDataError.tr(),
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
        exceptionMeassge: LocaleKeys.errors_database_addDataError.tr(),
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
        exceptionMeassge: LocaleKeys.errors_database_addDataError.tr(),
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
        exceptionMeassge: LocaleKeys.errors_database_getSingleDataError.tr(),
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
      throw CustomException(
        exceptionMeassge: LocaleKeys.errors_database_getNestedDataError.tr(),
      );
    }
  }

  @override
  Future<dynamic> getQueryData({
    required String path,
    required QueryParams query,
  }) async {
    try {
      Query<Map<String, dynamic>> data = firestore.collection(path);
      if (query.conditions != null) {
        for (var condition in query.conditions!) {
          if (condition.isGreaterThanOrEqualTo != null &&
              condition.isLessThanOrEqualTo != null) {
            data = data
                .where(
                  condition.field,
                  isGreaterThanOrEqualTo: condition.isGreaterThanOrEqualTo,
                )
                .where(
                  condition.field,
                  isLessThanOrEqualTo: condition.isLessThanOrEqualTo,
                );
          }

          if (condition.isEqualTo != null) {
            data = data.where(condition.field, isEqualTo: condition.isEqualTo);
          }

          if (condition.isLessThan != null) {
            data = data.where(
              condition.field,
              isLessThan: condition.isLessThan,
            );
          }

          if (condition.isGreaterThan != null) {
            data = data.where(
              condition.field,
              isGreaterThan: condition.isGreaterThan,
            );
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
      }

      var order = query.order;

      if (order != null) {
        data = data.orderBy(order.field, descending: order.descending);
      }

      var result = await data.get();
      return result.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.errors_database_getQueryDataError.tr(),
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
      throw CustomException(
        exceptionMeassge: LocaleKeys.errors_database_removeDataError.tr(),
      );
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
        exceptionMeassge: LocaleKeys.errors_database_addDataError.tr(),
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
        exceptionMeassge: LocaleKeys.errors_database_updateDataError.tr(),
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

      if (query.conditions != null) {
        for (var condition in query.conditions!) {
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
      }

      var order = query.order;
      if (order != null) {
        data = data.orderBy(order.field, descending: order.descending);
      }

      var result = data.snapshots();
      return result.map((snapshot) {
        // صورة كاملة من البيانات في الوقت ده !
        return snapshot.docs
            .map((doc) => doc.data())
            .toList(); // باخد الصورة والف على البيانات الي فيها
      });
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.errors_database_getStreamData.tr(),
      );
    }
  }

  @override
  Future<List<dynamic>> getPaginatedData({
    required String path,
    required String orderByField,
    int limit = 4,
    String? lastDocument,
  }) async {
    try {
      var query = firestore
          .collection(path)
          .orderBy(orderByField, descending: false)
          .limit(limit);

      if (lastDocument != null) {
        query = query.startAfter([lastDocument]);
      }

      var data = await query.get();

      return data.docs.map((doc) => doc.data()).toList();
    } catch (e) {
      throw CustomException(
        exceptionMeassge: LocaleKeys.errors_database_getDataError.tr(),
      );
    }
  }
}
