part of '../../domain/repositories/payment_history_repository.dart';

class PaymentHistoryRepositoryImpl implements PaymentHistoryRepository {
  PaymentHistoryRepositoryImpl({required this.dataSource});
  final PaymentHistoryDataSource dataSource;

  @override
  Future<(ErrorModel?, List<PaymentHistoryModel>?)> getPaymentHistory(
      String? month, String? year) async {
    return await dataSource.fetchPaymentHistory(month, year).guard(
          (data) => PaymentHistoryResponseModel.fromJson(data).data,
        );
  }
}
