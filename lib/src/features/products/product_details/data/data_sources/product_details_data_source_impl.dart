part of './product_details_data_source.dart';

class ProductDetailsDataSourceImpl implements ProductDetailsDataSource {
  ProductDetailsDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> verifyCustomer({required Map<String, dynamic> body}) {
    final response = restClient.post(
      APIType.protected,
      API.verifyCustomer,
      body,
    );

    return response;
  }
}
