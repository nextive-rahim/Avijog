import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:obhijuk/src/features/authentication/root/data/data_sources/authentication_data_source_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_data_source.g.dart';

@Riverpod(keepAlive: true)
AuthenticationDataSource authenticationDataSource(
    AuthenticationDataSourceRef ref) {
  return AuthenticationDataSourceImpl(ref.read(restClientProvider));
}

abstract class AuthenticationDataSource<T> {
  Future<Response> verifyUser(String phone);
  Future<Response> login(T? data);
  Future<Response> otpVerification(T? data);
  Future<Response> signUp(T? data);
  Future<Response> forgetPassword(T? data);
  Future<Response> resetPassword(T? data);
}
