part of './product_data_source.dart';

class ProductDataSourceImpl implements ProductDataSource {
  ProductDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> fetchProducts({String? vendorId}) async {
    final response = restClient.get(
      APIType.protected,
      API.products,
      queries: {
        if (vendorId != null) 'vendor': vendorId,
      },
    );

    return response;
  }

  @override
  Future<Response> fetchProduct({required String productId}) {
    final response = restClient.get(
      APIType.protected,
      '${API.products}/$productId',
    );

    return response;
  }
}
