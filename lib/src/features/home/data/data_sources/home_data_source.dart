import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:obhijuk/src/features/home/data/data_sources/home_data_source_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_data_source.g.dart';

abstract class HomeDataSource {
  Future<Response> fetchVendors();
  Future<Response> fetchBalance();
  Future<Response> fetchBanners();
}

@Riverpod()
HomeDataSource homeDataSource(HomeDataSourceRef ref) {
  return HomeDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}
