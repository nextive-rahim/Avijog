part of '../../domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  ProfileRepositoryImpl({required this.dataSource});
  final ProfileDataSource dataSource;

  @override
  Future<(ErrorModel?, UserEntity?)> getUser() async {
    return await dataSource.fetchUser().guard(
          (data) => UserResponseModel.fromJson(data).user,
        );
  }

  @override
  Future<(ErrorModel?, PrivacyPolicyEntity?)> getPrivacyPolicy() async {
    return await dataSource.fetchPrivacyPolicy().guard(
          (data) => PrivacyPolicyModel.fromJson(data),
        );
  }

  @override
  Future<(ErrorModel?, List<FaqEntity>?)> getFaqs() async {
    return await dataSource.fetchFaqs().guard(
          (data) => FaqResponseModel.fromJson(data).data,
        );
  }

  @override
  Future<(ErrorModel?, UserGuideEntity?)> getUserGuide() async {
    return await dataSource.fetchUseGuide().guard(
          (data) => UserGuideModel.fromJson(data),
        );
  }

  @override
  Future<(ErrorModel?, PinChangeEntity?)> pinChange(data) async {
    return await dataSource.pinChange(data).guard(
          (data) => PinChangeModel.fromJson(data),
        );
  }

  @override
  Future<(ErrorModel?, UserEntity?)> updateProfile(data) async {
    return await dataSource.updateProfile(data).guard(
          (data) => UserModel.fromJson(data),
        );
  }
}
