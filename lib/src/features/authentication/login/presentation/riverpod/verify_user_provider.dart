import 'package:obhijuk/src/features/authentication/root/domain/entities/verify_user_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/use_cases/authentication_use_cases.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/show_error_message_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_user_provider.g.dart';

@Riverpod(keepAlive: true)
class VerifyUser extends _$VerifyUser {
  @override
  Future<VerifyUserEntity> build() async {
    return VerifyUserEntity();
  }

  Future<VerifyUserEntity> checkUserVerification({
    String? phoneNumber,
  }) async {
    final authenticationUseCase = ref.read(authenticationUseCaseProvider);

    state = const AsyncValue.loading();
    final result = await authenticationUseCase.verifyUser(phoneNumber ?? '');

    return result.fold(
      (l) {
        ref
            .read(showErrorMessageProvider.notifier)
            .errorMessage(l.message ?? 'Something went wrong');
        state = AsyncError(
          VerifyUserEntity(message: l.message),
          StackTrace.current,
        );

        throw l;
      },
      (r) {
        state = AsyncData(r);
        return r;
      },
    );
  }
}
