import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/banner_entity.dart';
import 'package:obhijuk/src/features/home/domain/repository/home_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_banners_use_case.g.dart';

@Riverpod()
GetBannersUseCase getBannersUseCase(GetBannersUseCaseRef ref) {
  return GetBannersUseCase(
    homeRepository: ref.read(homeRepositoryProvider),
  );
}

class GetBannersUseCase {
  GetBannersUseCase({required this.homeRepository});
  final HomeRepository homeRepository;

  Future<(ErrorModel?, List<BannerEntity>?)> call() async {
    return await homeRepository.getBanners();
  }
}
