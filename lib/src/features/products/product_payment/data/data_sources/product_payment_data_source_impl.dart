part of 'product_payment_data_source.dart';

class ProductPaymentDataSourceImpl implements ProductPaymentDataSource {
  ProductPaymentDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> initiatePayment({
    required Map<String, dynamic> body,
    required PaymentMethod paymentMethod,
  }) {
    final response = restClient.post(
      APIType.protected,
      API.initiatePayment + paymentMethod.name,
      body,
    );

    return response;
  }
}
