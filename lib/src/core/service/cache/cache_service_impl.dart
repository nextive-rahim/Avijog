import 'package:hive_flutter/hive_flutter.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';

class CacheServiceImpl implements CacheService {
  CacheServiceImpl();

  late Box box;
  static const String _boxName = "Nextive Demo Basic App";

  @override
  Future<void> init() async {
    await Hive.initFlutter();
    box = await Hive.openBox(_boxName);
  }

  @override
  Future<void> save(String key, dynamic value) async {
    await box.put(key, value);
  }

  @override
  Future<dynamic> read(String key) async {
    return box.get(key);
  }

  @override
  Future<void> delete(String key) async {
    await box.delete(key);
  }

  @override
  Future<void> deleteAll() async {
    await box.clear();
  }
}
