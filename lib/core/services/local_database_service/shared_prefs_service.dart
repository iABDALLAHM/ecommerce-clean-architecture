import 'package:ecommerce_clean_architecture/core/services/local_database_service/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService implements LocalStorageService {
  final SharedPreferences sharedPreferences;

  SharedPrefService({required this.sharedPreferences});

  @override
  Future<void> clearData() async {
    await sharedPreferences.clear();
  }

  @override
  Future<bool> getBoolean({required String key}) async {
    return sharedPreferences.getBool(key) ?? false;
  }

  @override
  Future<void> setBoolean({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }
}
