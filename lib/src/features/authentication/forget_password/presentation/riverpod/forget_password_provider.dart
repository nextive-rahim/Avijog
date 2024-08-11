import 'package:obhijuk/src/features/authentication/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/use_cases/authentication_use_cases.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/show_error_message_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'forget_password_provider.g.dart';

@Riverpod(keepAlive: true)
class ForgetPassword extends _$ForgetPassword {
  @override
  Future<ForgotPasswordEntity> build() async {
    return ForgotPasswordEntity();
  }

  Future<ForgotPasswordEntity> forgetPassword({
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final forgetPasswordUseCase = ref.read(authenticationUseCaseProvider);
    Map<String, dynamic> body = {
      'phone': phone,
      'password': password,
      'repeat_password': confirmPassword,
    };

    state = const AsyncValue.loading();
    final result = await forgetPasswordUseCase.forgetPassword(body);

    return result.fold(
      (l) {
        ref
            .read(showErrorMessageProvider.notifier)
            .errorMessage(l.message ?? 'Something went wrong');
        state = AsyncError(l, StackTrace.current);

        throw l;
      },
      (r) {
        state = AsyncData(r);
        return r;
      },
    );
  }
}
