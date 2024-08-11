import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/balance_entity.dart';
import 'package:obhijuk/src/features/home/domain/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_balance_use_case.g.dart';

@Riverpod()
GetBalanceUseCase getBalanceUseCase(GetBalanceUseCaseRef ref) {
  return GetBalanceUseCase(
    homeRepository: ref.read(homeRepositoryProvider),
  );
}

class GetBalanceUseCase {
  GetBalanceUseCase({required this.homeRepository});
  final HomeRepository homeRepository;

  Future<(ErrorModel?, BalanceEntity?)> call() async {
    return await homeRepository.getBalance();
  }
}
