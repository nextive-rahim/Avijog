import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/data/data_sources/profile_data_source.dart';
import 'package:obhijuk/src/features/profile/root/data/models/faq_model.dart';
import 'package:obhijuk/src/features/profile/root/data/models/pin_change_model.dart';
import 'package:obhijuk/src/features/profile/root/data/models/privacy_policy_model.dart';
import 'package:obhijuk/src/features/profile/root/data/models/user_guide_model.dart';
import 'package:obhijuk/src/features/profile/root/data/models/user_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/faq_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/pin_change_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/privacy_policy_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_guide_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_repository.g.dart';
part '../../data/repositories/profile_repository_impl.dart';

@Riverpod()
ProfileRepository profileRepository(ProfileRepositoryRef ref) {
  return ProfileRepositoryImpl(dataSource: ref.read(profileDataSourceProvider));
}

abstract class ProfileRepository<T> {
  Future<(ErrorModel?, UserEntity?)> getUser();
  Future<(ErrorModel?, PrivacyPolicyEntity?)> getPrivacyPolicy();
  Future<(ErrorModel?, List<FaqEntity>?)> getFaqs();
  Future<(ErrorModel?, UserGuideEntity?)> getUserGuide();
  Future<(ErrorModel?, PinChangeEntity?)> pinChange(T? data);
  Future<(ErrorModel?, UserEntity?)> updateProfile(T? data);
}
