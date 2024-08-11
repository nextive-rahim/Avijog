import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'profile_data_source.g.dart';
part 'profile_data_source_impl.dart';

@Riverpod()
ProfileDataSource profileDataSource(ProfileDataSourceRef ref) {
  return ProfileDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}

abstract class ProfileDataSource<T> {
  Future<Response> fetchUser();
  Future<Response> fetchPrivacyPolicy();
  Future<Response> fetchFaqs();
  Future<Response> fetchUseGuide();
  Future<Response> pinChange(T? data);
  Future<Response> updateProfile(T? data);
}
