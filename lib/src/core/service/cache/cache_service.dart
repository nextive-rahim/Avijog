import 'package:obhijuk/src/core/service/cache/cache_service_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_service.g.dart';

@Riverpod(keepAlive: true)
CacheService cacheService(CacheServiceRef ref) => CacheServiceImpl();
// final cacheServiceProvider = Provider<CacheService>(
//   (ref) => CacheServiceImpl(),
// );

abstract class CacheService {
  Future<void> init();

  Future<void> save(String key, dynamic value);

  Future<dynamic> read(String key);

  Future<void> delete(String key);

  Future<void> deleteAll();
}
