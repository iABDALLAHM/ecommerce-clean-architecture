abstract class LocalStorageService {
  Future<void> setBoolean({required String key, required bool value});
  Future<bool> getBoolean({required String key});
  Future<void> clearData();
}
