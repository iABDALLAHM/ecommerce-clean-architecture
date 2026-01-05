import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsService {
  static late SharedPreferences sharedPreferences;
  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<void> setBool({
    required String key,
    required bool value,
  }) async {
    await sharedPreferences.setBool(key, value);
  }

  static bool getBool({required String key}) {
    return sharedPreferences.getBool(key) ?? false;
  }
}
