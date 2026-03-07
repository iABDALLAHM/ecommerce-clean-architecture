import 'package:ecommerce_clean_architecture/core/models/query_prams.dart';

abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  });

  Future<void> addSingleData({
    required String path,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<void> addNestedData({
    required String path,
    required String subCollection,
    required String documentId,
    required Map<String, dynamic> data,
  });

  Future<dynamic> getSingleData({
    required String path,
    required String documentId,
  });

  Future<dynamic> getQueryData({
    required String path,
    required QueryParams query,
  });

  Future<dynamic> getNestedData({
    required String path,
    required String documentId,
    required String subCollection,
  });

  Future<dynamic> getData({required String path});
}
