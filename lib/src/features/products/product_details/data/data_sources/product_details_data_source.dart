import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_data_source.g.dart';
part 'product_details_data_source_impl.dart';

@Riverpod()
ProductDetailsDataSource productDetailsDataSource(
    ProductDetailsDataSourceRef ref) {
  return ProductDetailsDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}

abstract class ProductDetailsDataSource {
  Future<Response> verifyCustomer({required Map<String, dynamic> body});
}
