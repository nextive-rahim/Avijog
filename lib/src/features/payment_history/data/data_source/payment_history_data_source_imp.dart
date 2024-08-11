part of 'payment_history_data_source.dart';

class PaymentHistoryDataSourceImpl implements PaymentHistoryDataSource {
  PaymentHistoryDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> fetchPaymentHistory(String? month, String? year) async {
    final response = await restClient.get(
      APIType.protected,
      month!.isEmpty && year!.isEmpty
          ? API.paymnetHistory
          : '${API.paymnetHistory}?month=$month&year=$year',
    );

    return response;
  }
}
