import 'package:dartz/dartz.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/authentication/forget_password/domain/entities/forgot_password_entity.dart';
import 'package:obhijuk/src/features/authentication/otp/domain/entities/otp_verification_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/entities/authentication_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/entities/verify_user_entity.dart';
import 'package:obhijuk/src/features/authentication/root/domain/repositories/authentication_repository.dart';
import 'package:obhijuk/src/features/profile/root/data/models/user_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'authentication_use_cases.g.dart';

@Riverpod(keepAlive: true)
AuthenticationUseCase authenticationUseCase(AuthenticationUseCaseRef ref) {
  return AuthenticationUseCase(ref.read(authenticationRepositoryProvider));
}

class AuthenticationUseCase<T> {
  AuthenticationUseCase(this._repository);
  final AuthenticationRepository _repository;
  Future<Either<ErrorModel, VerifyUserEntity>> verifyUser(
      String phoneNumber) async {
    return await _repository.verifyUser(phoneNumber);
  }

  Future<(ErrorModel?, AuthenticationEntity?)> login(T? body) async {
    return await _repository.login(body);
  }

  Future<Either<ErrorModel, OtpVerificationEntity>> otpVerification(
      T? body) async {
    return await _repository.otpVerification(body);
  }

  Future<Either<ErrorModel, ForgotPasswordEntity>> forgetPassword(
      T? body) async {
    return await _repository.forgetPassword(body);
  }

  Future<Either<ErrorModel, AuthenticationEntity>> signUp(T? body) async {
    return await _repository.signUp(body);
  }

  Future<Either<ErrorModel, UserResponseModel>> resetPassword(T? body) async {
    return await _repository.resetPassword(body);
  }
}
