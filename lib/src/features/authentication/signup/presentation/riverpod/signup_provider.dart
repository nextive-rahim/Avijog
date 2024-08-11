import 'package:obhijuk/src/core/service/cache/cache_keys.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';
import 'package:obhijuk/src/features/authentication/root/domain/entities/authentication_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/use_cases/authentication_use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'signup_provider.g.dart';

@Riverpod(keepAlive: true)
class SignUp extends _$SignUp {
  @override
  Future<AuthenticationEntity> build() async {
    return AuthenticationEntity();
  }

  Future<AuthenticationEntity> signUp({
    required Map<String, dynamic> payload,
  }) async {
    final signUpUseCase = ref.read(authenticationUseCaseProvider);

    state = const AsyncValue.loading();
    final result = await signUpUseCase.signUp(payload);

    return result.fold(
      (l) {
        state = AsyncError(
          l.message ?? 'Something went wrong',
          StackTrace.current,
        );

        throw l;
      },
      (r) {
        state = AsyncData(r);
        ref.read(cacheServiceProvider).save(CacheKeys.token, r.accessToken);

        return r;
      },
    );
  }
}
