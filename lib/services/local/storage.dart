part of '../index.dart';

class StorageService extends GetxService {
  static StorageService get to => Get.find();
  late final SharedPreferences _prefs;

  Future<StorageService> init() async {
    _prefs = await SharedPreferences.getInstance();
    return this;
  }

  Future<bool> setString(String key, String value) async {
    return  _prefs.setString(key, value);
  }

  Future<bool> setInt(String key, int value) async {
    return _prefs.setInt(key, value);
  }

  Future<bool> setBool(String key, bool value) async {
    return await _prefs.setBool(key, value);
  }

  Future<bool> setList(String key, List<String> value) async {
    return await _prefs.setStringList(key, value);
  }

  String getString(String key) {
    return _prefs.getString(key) ?? '';
  }

  int getInt(String key) {
    return _prefs.getInt(key) ?? 0;
  }

  bool? getBool(String key, {bool? isDefault}) {
    return _prefs.getBool(key) ?? isDefault;
  }

  List<String> getList(String key) {
    return _prefs.getStringList(key) ?? [];
  }

  Future<bool> remove(String key) async {
    return _prefs.remove(key);
  }
}
