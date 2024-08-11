import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:obhijuk/src/features/home/data/data_sources/home_data_source.dart';

class HomeDataSourceImpl implements HomeDataSource {
  HomeDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> fetchVendors() async {
    final response = await restClient.get(
      APIType.protected,
      API.vendors,
    );

    return response;
  }

  @override
  Future<Response> fetchBalance() async {
    final response = await restClient.get(
      APIType.protected,
      API.balance,
    );

    return response;
  }

  @override
  Future<Response> fetchBanners() async {
    final response = await restClient.get(
      APIType.protected,
      API.banners,
    );

    return response;
  }
}
