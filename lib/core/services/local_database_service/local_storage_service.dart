abstract class LocalStorageService {
  Future<void> setBoolean({required String key, required bool value});
  Future<bool> getBoolean({required String key});
  Future<void> clearData();
  Future<void> setStringList({required String key, required List<String> data});
  Future<List<String>?> getStringList({required String key});
}
