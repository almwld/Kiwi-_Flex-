import 'package:hive_flutter/hive_flutter.dart';

class LocalStorageService {
  static Box? _box;

  static Future<void> init() async {
    await Hive.initFlutter();
    _box = await Hive.openBox('flex_cache');
  }

  static Future<void> save(String key, dynamic value) async {
    await _box?.put(key, value);
  }

  static dynamic get(String key) {
    return _box?.get(key);
  }

  static Future<void> delete(String key) async {
    await _box?.delete(key);
  }

  static Future<void> clear() async {
    await _box?.clear();
  }
}
