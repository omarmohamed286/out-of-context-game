import 'package:shared_preferences/shared_preferences.dart';

class CacheService {
  static late SharedPreferences prefs;

  static Future<void> initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setStringList(
      {required String key, required List<String> value}) async {
    await prefs.setStringList(key, value);
  }

  static List<String>? getStringList({required String key}) {
    return prefs.getStringList(key);
  }
}
