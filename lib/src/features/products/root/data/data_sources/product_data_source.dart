import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part './product_data_source_impl.dart';
part 'product_data_source.g.dart';

@Riverpod()
ProductDataSource productDataSource(ProductDataSourceRef ref) {
  return ProductDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}

abstract class ProductDataSource {
  Future<Response> fetchProducts({String? vendorId});
  Future<Response> fetchProduct({required String productId});
}
