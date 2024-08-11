import 'package:obhijuk/src/core/service/cache/cache_keys.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/authentication/root/domain/entities/authentication_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/use_cases/authentication_use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_provider.g.dart';

@Riverpod(keepAlive: false)
class Login extends _$Login {
  @override
  Future<AuthenticationEntity> build() async {
    return AuthenticationEntity();
  }

  Future<AuthenticationEntity> login(Map<String, dynamic>? params) async {
    final authenticationUseCase = ref.read(authenticationUseCaseProvider);

    state = const AsyncValue.loading();

    ErrorModel? errorModel;
    AuthenticationEntity? loginEntity;

    (errorModel, loginEntity) = await authenticationUseCase.login(params);
    if (errorModel != null) {
      state = AsyncValue.error(errorModel.message!, StackTrace.current);
      throw errorModel;
    } else {
      ref.read(cacheServiceProvider)
        ..save(CacheKeys.token, loginEntity!.accessToken)
        ..save(CacheKeys.refreshToken, loginEntity.refreshToken);
      state = AsyncData(loginEntity);
      return loginEntity;
    }
  }
}
