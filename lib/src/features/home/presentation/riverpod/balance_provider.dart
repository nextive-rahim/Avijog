import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/balance_entity.dart';
import 'package:obhijuk/src/features/home/domain/use_cases/get_balance_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'balance_provider.g.dart';

@Riverpod(keepAlive: true)
Future<BalanceEntity?> balance(BalanceRef ref) async {
  final getBalanceUseCase = ref.read(getBalanceUseCaseProvider);

  ErrorModel? errorModel;
  BalanceEntity? balance;

  (errorModel, balance) = await getBalanceUseCase();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return balance;
  }
}
