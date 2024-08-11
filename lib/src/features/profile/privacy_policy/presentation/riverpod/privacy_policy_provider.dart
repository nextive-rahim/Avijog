import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/privacy_policy_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/use_cases/profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'privacy_policy_provider.g.dart';

@Riverpod(keepAlive: true)
Future<PrivacyPolicyEntity?> privacyPolicy(PrivacyPolicyRef ref) async {
  final profileUseCase = ref.read(profileUseCaseProvider);

  ErrorModel? errorModel;
  PrivacyPolicyEntity? privacyPolicy;

  (errorModel, privacyPolicy) = await profileUseCase.callPrivacyPolicy();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return privacyPolicy;
  }
}
