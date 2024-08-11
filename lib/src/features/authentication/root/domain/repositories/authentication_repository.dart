import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/core/logger/logger.dart';
import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/core/service/exception/network_exception.dart';
import 'package:obhijuk/src/features/authentication/forget_password/data/models/forgot_password_response_model.dart';
import 'package:obhijuk/src/features/authentication/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:obhijuk/src/features/authentication/otp/data/models/otp_verification_response_model.dart';
import 'package:obhijuk/src/features/authentication/otp/domain/entities/otp_verification_entity.dart';
import 'package:obhijuk/src/features/authentication/root/data/data_sources/authentication_data_source.dart';
import 'package:obhijuk/src/features/authentication/root/data/models/authentication_response_model.dart';
import 'package:obhijuk/src/features/authentication/root/data/models/verify_user_response_model.dart';
import 'package:obhijuk/src/features/authentication/root/domain/entities/authentication_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/entities/verify_user_entity.dart';
import 'package:obhijuk/src/features/profile/root/data/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../data/repositories/authentication_repository_impl.dart';
part 'authentication_repository.g.dart';

@Riverpod(keepAlive: true)
AuthenticationRepository authenticationRepository(
    AuthenticationRepositoryRef ref) {
  return AuthenticationRepositoryImpl(
    dataSource: ref.read(authenticationDataSourceProvider),
    ref: ref,
  );
}

abstract class AuthenticationRepository<T> {
  Future<Either<ErrorModel, VerifyUserEntity>> verifyUser(String slug);
  Future<(ErrorModel?, AuthenticationEntity?)> login(T? data);
  Future<Either<ErrorModel, OtpVerificationEntity>> otpVerification(T? data);
  Future<Either<ErrorModel, AuthenticationEntity>> signUp(T? data);
  Future<Either<ErrorModel, ForgotPasswordEntity>> forgetPassword(T? data);
  Future<Either<ErrorModel, UserResponseModel>> resetPassword(T? data);
}
