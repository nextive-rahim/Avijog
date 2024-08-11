import 'package:obhijuk/src/features/authentication/otp/domain/entities/otp_verification_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/use_cases/authentication_use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'otp_verification_provider.g.dart';

@Riverpod(keepAlive: true)
class OtpVerification extends _$OtpVerification {
  @override
  Future<OtpVerificationEntity> build() async {
    return OtpVerificationEntity();
  }

  Future<OtpVerificationEntity> otpVerification({String? phone}) async {
    final authenticationUseCase = ref.read(authenticationUseCaseProvider);

    Map<String, dynamic> body = {
      'phone': phone,
    };

    state = const AsyncValue.loading();
    final result = await authenticationUseCase.otpVerification(body);

    return result.fold(
      (l) {
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
