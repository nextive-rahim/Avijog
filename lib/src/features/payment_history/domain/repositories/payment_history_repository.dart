import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/payment_history/data/data_source/payment_history_data_source.dart';
import 'package:obhijuk/src/features/payment_history/data/models/payment_history_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../data/repositories/payment_history_repository_imp.dart';
part 'payment_history_repository.g.dart';

@Riverpod()
PaymentHistoryRepository paymentHistoryRepository(
    PaymentHistoryRepositoryRef ref) {
  return PaymentHistoryRepositoryImpl(
    dataSource: ref.read(paymentHistoryDataSourceProvider),
  );
}

abstract class PaymentHistoryRepository {
  Future<(ErrorModel?, List<PaymentHistoryModel>?)> getPaymentHistory(
      String? month, String? year);
}
