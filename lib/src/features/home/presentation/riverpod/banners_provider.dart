import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/banner_entity.dart';
import 'package:obhijuk/src/features/home/domain/use_cases/get_banners_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'banners_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<BannerEntity>> banners(BannersRef ref) async {
  final getBannersUseCase = ref.read(getBannersUseCaseProvider);

  ErrorModel? errorModel;
  List<BannerEntity>? banners;

  (errorModel, banners) = await getBannersUseCase();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return banners ?? [];
  }
}
