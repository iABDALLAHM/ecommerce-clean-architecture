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
}
