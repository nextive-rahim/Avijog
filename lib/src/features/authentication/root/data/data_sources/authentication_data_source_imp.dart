import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:obhijuk/src/features/authentication/root/data/data_sources/authentication_data_source.dart';

class AuthenticationDataSourceImpl extends AuthenticationDataSource {
  AuthenticationDataSourceImpl(this.restClient);
  final RestClient restClient;

  @override
  Future<Response> verifyUser(String phone) async {
    return await restClient.post(
      APIType.public,
      API.verifyUser,
      {
        'phone': phone,
        "recaptcha": "668be73dcad2999a957ff440",
      },
    );
  }

  @override
  Future<Response> login(data) async {
    final response = await restClient.post(
      APIType.public,
      API.login,
      data,
    );

    return response;
  }

  @override
  Future<Response> otpVerification(data) async {
    final response = await restClient.post(
      APIType.public,
      API.otpVerification,
      data,
    );

    return response;
  }

  @override
  Future<Response> signUp(data) async {
    final response = await restClient.post(
      APIType.public,
      API.signUp,
      data,
    );

    return response;
  }

  @override
  Future<Response> forgetPassword(data) async {
    final response = await restClient.post(
      APIType.public,
      API.forgetPassword,
      data,
    );

    return response;
  }

  @override
  Future<Response> resetPassword(data) async {
    final response = await restClient.post(
      APIType.public,
      API.resetPassword,
      data,
    );

    return response;
  }
}
