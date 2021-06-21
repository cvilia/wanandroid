import 'package:flutter/services.dart';
import 'package:wanandroid/bridge/log.dart';

class MMKV {
  static MethodChannel _mmkvChannel = MethodChannel('com.cvilia.wanandroid.io/mmkv');

  static Future<bool> setInt({required int value, required String key}) async {
    return await _invokeSet('setInt', key, value);
  }

  static Future<bool> setString({required String value, required String key}) async {
    return await _invokeSet('setString', key, value);
  }

  static Future<bool> setBool({required bool value, required String key}) async {
    return await _invokeSet('setBool', key, value);
  }

  static Future<int> getInt({required String key, int defaultValue = 0}) async {
    return await _invokeGet('getInt', key, defaultValue);
  }

  static Future<String> getString({required String key, String defaultValue = ''}) async {
    return await _invokeGet('getString', key, defaultValue);
  }

  static Future<bool> getBool({required String key, bool defaultValue = false}) async {
    return await _invokeGet('getBool', key, defaultValue);
  }

  static Future<bool> _invokeSet(String method, String key, dynamic value) async {
    try {
      return await _mmkvChannel.invokeMethod(method, {'value': value, "key": key});
    } on MissingPluginException catch (e) {
      Log.e('MMKV', 'bridge Log miss plugin');
    } on PlatformException catch (e) {
      Log.e('MMKV', 'invoke method Log.$method error,error message:${e.message}');
    }
    return false;
  }

  static Future<dynamic> _invokeGet(String method, String key, dynamic value) async {
    try {
      return await _mmkvChannel.invokeMethod(method, {'defaultValue': value, "key": key});
    } on MissingPluginException catch (e) {
      Log.e('MMKV', 'bridge Log miss plugin');
    } on PlatformException catch (e) {
      Log.e('MMKV', 'invoke method Log.$method error,error message:${e.message}');
    }
    return false;
  }
}
