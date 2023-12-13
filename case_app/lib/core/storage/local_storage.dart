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

  static Future<int?> getInt(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.getInt(key);
  }

  static Future<bool> setInt(String key, int value) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.setInt(key, value);
  }

  static Future<bool?> getBool(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.getBool(key);
  }

  static Future<bool> setBool(String key, bool value) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.setBool(key, value);
  }

  static Future<double?> getDouble(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.getDouble(key);
  }

  static Future<bool> setDouble(String key, double value) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.setDouble(key, value);
  }

  static Future<List<String>?> getStringList(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.getStringList(key);
  }

  static Future<bool> setStringList(String key, List<String> value) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.setStringList(key, value);
  }

  static Future<bool> remove(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.remove(key);
  }

  static Future<bool> clear() async {
    final SharedPreferences prefs = await getInstance();
    return prefs.clear();
  }

  static Future<bool> contains(String key) async {
    key = StorageConstants.prefix + key;
    final SharedPreferences prefs = await getInstance();
    return prefs.containsKey(key);
  }
}
