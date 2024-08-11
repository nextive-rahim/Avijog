import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/use_cases/profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_profile_provider.g.dart';

@Riverpod(keepAlive: true)
class UpdateProfile extends _$UpdateProfile {
  @override
  FutureOr<UserEntity> build() async {
    return UserEntity();
  }

  Future<UserEntity> updateProfile(Map<String, dynamic>? params) async {
    final profileUseCase = ref.read(profileUseCaseProvider);

    state = const AsyncValue.loading();

    ErrorModel? errorModel;
    UserEntity? userEntity;

    (errorModel, userEntity) = await profileUseCase.updateProfile(params);
    if (errorModel != null) {
      state = AsyncValue.error(errorModel.message!, StackTrace.current);
      throw errorModel;
    } else {
      state = AsyncValue.data(userEntity!);
      return userEntity;
    }
  }
}
