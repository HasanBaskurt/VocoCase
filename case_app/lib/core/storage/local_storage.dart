import 'package:case_app/core/constants/storage_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static Future<SharedPreferences> getInstance() async {
    return SharedPreferences.getInstance();
  }

  static Future<String?> getString(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.getString(key);
  }

  static Future<bool> setString(String key, String value) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.setString(key, value);
  }

  static Future<void> resetShared() async {
    final SharedPreferences prefs = await getInstance();
    prefs.clear();
  }
}
