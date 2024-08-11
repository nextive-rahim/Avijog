part of '../../domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.dataSource,
    required this.ref,
  });

  final AuthenticationDataSource dataSource;
  final Ref ref;
  @override
  Future<Either<ErrorModel, VerifyUserEntity>> verifyUser(String slug) async {
    try {
      final response = await dataSource.verifyUser(slug);
      final model = VerifyUserResponseModel.fromJson(response.data);

      return Right(model);
    } on NetworkException catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(e.errorModel.error!);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(ErrorModel());
    }
  }

  @override
  Future<(ErrorModel?, AuthenticationEntity?)> login(data) async {
    return await dataSource.login(data).guard(
          (data) => AuthenticationResponseModel.fromJson(data),
        );
  }

  @override
  Future<Either<ErrorModel, OtpVerificationEntity>> otpVerification(
      data) async {
    try {
      final response = await dataSource.otpVerification(data);
      final model = OtpVerificationResponseModel.fromJson(response.data);

      return Right(model);
    } on NetworkException catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(e.errorModel.error!);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(ErrorModel());
    }
  }

  @override
  Future<Either<ErrorModel, AuthenticationEntity>> signUp(data) async {
    try {
      final response = await dataSource.signUp(data);
      final model = AuthenticationResponseModel.fromJson(response.data);

      return Right(model);
    } on NetworkException catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(e.errorModel.error!);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(ErrorModel());
    }
  }

  @override
  Future<Either<ErrorModel, ForgotPasswordEntity>> forgetPassword(data) async {
    try {
      final response = await dataSource.forgetPassword(data);
      final model = ForgotPasswordResponseModel.fromJson(response.data);

      return Right(model);
    } on NetworkException catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(e.errorModel.error!);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(ErrorModel());
    }
  }

  @override
  Future<Either<ErrorModel, UserResponseModel>> resetPassword(data) async {
    try {
      final response = await dataSource.resetPassword(data);
      final model = UserResponseModel.fromJson(response.data);

      return Right(model);
    } on NetworkException catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(e.errorModel.error!);
    } catch (e, stackTrace) {
      Log.error(e.toString());
      Log.error(stackTrace.toString());

      return Left(ErrorModel());
    }
  }
}
