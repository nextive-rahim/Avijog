import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_guide_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/use_cases/profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_guide_provider.g.dart';

@Riverpod(keepAlive: true)
Future<UserGuideEntity?> userGuide(UserGuideRef ref) async {
  final profileUseCase = ref.read(profileUseCaseProvider);

  ErrorModel? errorModel;
  UserGuideEntity? userGuide;

  (errorModel, userGuide) = await profileUseCase.callUserGuide();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return userGuide;
  }
}
