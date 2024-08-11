import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';
import 'package:obhijuk/src/features/home/domain/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_vendors_use_case.g.dart';

@Riverpod()
GetVendorsUseCase getVendorsUseCase(GetVendorsUseCaseRef ref) {
  return GetVendorsUseCase(
    homeRepository: ref.read(homeRepositoryProvider),
  );
}

class GetVendorsUseCase {
  GetVendorsUseCase({required this.homeRepository});
  final HomeRepository homeRepository;

  Future<(ErrorModel?, List<VendorEntity>?)> call() async {
    return await homeRepository.getVendors();
  }
}
