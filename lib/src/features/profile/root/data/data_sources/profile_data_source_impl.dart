part of 'profile_data_source.dart';

class ProfileDataSourceImpl implements ProfileDataSource {
  ProfileDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> fetchUser() async {
    final response = await restClient.get(
      APIType.protected,
      API.user,
    );

    return response;
  }

  @override
  Future<Response> fetchPrivacyPolicy() async {
    final response = await restClient.get(
      APIType.protected,
      API.privacyPolicy,
    );

    return response;
  }

  @override
  Future<Response> fetchFaqs() async {
    final response = await restClient.get(
      APIType.protected,
      API.faqs,
    );

    return response;
  }

  @override
  Future<Response> fetchUseGuide() async {
    final response = await restClient.get(
      APIType.protected,
      API.userGuide,
    );

    return response;
  }

  @override
  Future<Response> pinChange(data) async {
    final response = await restClient.post(
      APIType.protected,
      API.pinChange,
      data,
    );

    return response;
  }

  @override
  Future<Response> updateProfile(data) async {
    final response = await restClient.put(
      APIType.protected,
      API.updateProfile,
      data,
    );

    return response;
  }
}
