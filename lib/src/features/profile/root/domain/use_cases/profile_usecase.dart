import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/faq_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/pin_change_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/privacy_policy_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_guide_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/repositories/profile_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_usecase.g.dart';

@Riverpod()
ProfileUseCase profileUseCase(ProfileUseCaseRef ref) {
  return ProfileUseCase(ref.read(profileRepositoryProvider));
}

class ProfileUseCase<T> {
  final ProfileRepository _repository;

  ProfileUseCase(this._repository);
  Future<(ErrorModel?, UserEntity?)> callUser() {
    return _repository.getUser();
  }

  Future<(ErrorModel?, PrivacyPolicyEntity?)> callPrivacyPolicy() {
    return _repository.getPrivacyPolicy();
  }

  Future<(ErrorModel?, List<FaqEntity>?)> callFaqs() {
    return _repository.getFaqs();
  }

  Future<(ErrorModel?, UserGuideEntity?)> callUserGuide() {
    return _repository.getUserGuide();
  }

  Future<(ErrorModel?, PinChangeEntity?)> pinChange(data) {
    return _repository.pinChange(data);
  }

  Future<(ErrorModel?, UserEntity?)> updateProfile(data) {
    return _repository.updateProfile(data);
  }
}
