import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/use_cases/profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_provider.g.dart';

@Riverpod(keepAlive: true)
Future<UserEntity?> user(UserRef ref) async {
  final profileUseCase = ref.read(profileUseCaseProvider);

  ErrorModel? errorModel;
  UserEntity? user;

  (errorModel, user) = await profileUseCase.callUser();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return user;
  }
}
