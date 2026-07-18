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

  void saveData({required String key, required String value}) {
    sharedPreferences.setString(key, value);
  }

  String getData({required String key}) {
    return sharedPreferences.getString(key) ?? "";
  }

  Future<bool> clearDate() async {
    return await sharedPreferences.clear();
  }
}
