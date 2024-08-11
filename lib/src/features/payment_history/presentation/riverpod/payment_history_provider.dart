import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/payment_history/data/models/payment_history_model.dart';
import 'package:obhijuk/src/features/payment_history/domain/use_cases/payment_history_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'payment_history_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<PaymentHistoryModel>> paymentHistory(
    PaymentHistoryRef ref, String month, String year) async {
  final paymentHistoryUseCase = ref.read(paymentHistoryUseCaseProvider);

  ErrorModel? errorModel;
  List<PaymentHistoryModel>? vendors;

  (errorModel, vendors) = await paymentHistoryUseCase.call(month, year);

  if (errorModel != null) {
    throw errorModel;
  } else {
    return vendors ?? [];
  }
}

final selectedMonthProvider = StateProvider<String?>((ref) => null);
final selectedYearProvider = StateProvider<String?>((ref) => null);
