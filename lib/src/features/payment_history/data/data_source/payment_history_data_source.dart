import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_history_data_source.g.dart';
part 'payment_history_data_source_imp.dart';

@Riverpod()
PaymentHistoryDataSource paymentHistoryDataSource(
    PaymentHistoryDataSourceRef ref) {
  return PaymentHistoryDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}

abstract class PaymentHistoryDataSource {
  Future<Response> fetchPaymentHistory(String? month, String? year);
}
