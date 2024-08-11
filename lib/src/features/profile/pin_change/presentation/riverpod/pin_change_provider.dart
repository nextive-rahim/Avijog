import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/pin_change_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/use_cases/profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'pin_change_provider.g.dart';

@Riverpod(keepAlive: true)
class PinChange extends _$PinChange {
  @override
  FutureOr<PinChangeEntity> build() async {
    return PinChangeEntity();
  }

  Future<PinChangeEntity> pinChange(Map<String, dynamic>? params) async {
    final profileUseCase = ref.read(profileUseCaseProvider);

    state = const AsyncValue.loading();

    ErrorModel? errorModel;
    PinChangeEntity? pinChangeEntity;

    (errorModel, pinChangeEntity) = await profileUseCase.pinChange(params);
    if (errorModel != null) {
      state = AsyncValue.error(errorModel.message!, StackTrace.current);
      throw errorModel;
    } else {
      state = AsyncValue.data(pinChangeEntity!);
      return pinChangeEntity;
    }
  }
}
