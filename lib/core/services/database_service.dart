abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? documentId,
    bool? isNestedData,
    String? secondPath,
  });
  Future<dynamic> getData({required String path, String? documentId});
}
