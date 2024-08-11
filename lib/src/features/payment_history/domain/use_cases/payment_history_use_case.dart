import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/payment_history/data/models/payment_history_model.dart';
import 'package:obhijuk/src/features/payment_history/domain/repositories/payment_history_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_history_use_case.g.dart';

@Riverpod()
PaymentHistoryUseCase paymentHistoryUseCase(PaymentHistoryUseCaseRef ref) {
  return PaymentHistoryUseCase(
    paymentRepository: ref.read(paymentHistoryRepositoryProvider),
  );
}

class PaymentHistoryUseCase {
  PaymentHistoryUseCase({required this.paymentRepository});
  final PaymentHistoryRepository paymentRepository;

  Future<(ErrorModel?, List<PaymentHistoryModel>?)> call(
      String? month, String? year) async {
    return await paymentRepository.getPaymentHistory(month, year);
  }
}
