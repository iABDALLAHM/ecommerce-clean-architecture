import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  final FlutterSecureStorage _storage;

  SecureStorageService({required FlutterSecureStorage storage})
    : _storage = storage;

  static const String keyUserId = 'user_id';

  Future<void> saveData({required String key, required String value}) async {
    await _storage.write(key: key, value: value);
  }

  Future getData({required String key}) async {
    return await _storage.read(key: key);
  }

  void deleteData({required String key}) async {
    await _storage.delete(key: key);
  }

  void clearAll() async {
    await _storage.deleteAll();
  }
}
