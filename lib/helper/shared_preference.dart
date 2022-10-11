import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class StorageHelper {
  StorageHelper._();

  static SharedPreferences? prefs;
  static String isUserLoggedIn = "isUserLoggedIn";
  static String userLoginResponse = "userLoginResponse";
  static String userToken = "userToken";
  static String subDomainClientDetailsResponse =
      "subDomainClientDetailsResponse";
  static String subDomainName = "subDomainName";
  static String deviceInfo = "deviceInfo";
  static String platForm = "platForm";

  static Future<dynamic> _getInstance() async =>
      prefs = await SharedPreferences.getInstance();

  static Future<String?> getStringVal(String key) async {
    await _getInstance();
    return prefs!.getString(key);
  }

  static setStringVal(String key, dynamic value) async {
    await _getInstance();
    prefs!.setString(key, value);
  }

  static clearAllData() async {
    await _getInstance();
    prefs!.clear();
  }

  static setBoolVal(String key, dynamic value) async {
    await _getInstance();
    prefs!.setBool(key, value);
  }

  static Future<bool?> getBoolVal(String key) async {
    await _getInstance();
    return prefs!.getBool(key);
  }

  static removeKey(String key) async {
    await _getInstance();
    prefs!.remove(key);
  }

  static setIntVal(String key, int value) async {
    await _getInstance();
    prefs!.setInt(key, value);
  }

  static Future<int?> getIntVal(String key) async {
    await _getInstance();
    return prefs!.getInt(key);
  }

  static setDoubleVal(String key, double value) async {
    await _getInstance();
    prefs!.setDouble(key, value);
  }

  static Future<double?> getDoubleVal(String key) async {
    await _getInstance();
    return prefs!.getDouble(key);
  }
}
