import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefService {
  final SharedPreferences sharedPreferences;

  SharedPrefService({required this.sharedPreferences});

  Future<void> setBool({required String key, required bool value}) async {
    await sharedPreferences.setBool(key, value);
  }

  bool getBool({required String key}) {
    return sharedPreferences.getBool(key) ?? false;
  }

  Future<void> saveData({required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  String? getData({required String key}) {
    return sharedPreferences.getString(key);
  }

  Future<void> removeData({required String key}) async {
    await sharedPreferences.remove(key);
  }

  Future<void> removeBool({required String key}) async {
    await sharedPreferences.remove(key);
  }
}
