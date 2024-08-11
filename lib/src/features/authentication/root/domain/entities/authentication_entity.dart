import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';

class AuthenticationEntity {
  String? message;
  String? accessToken;
  String? refreshToken;
  UserEntity? user;

  AuthenticationEntity({
    this.message,
    this.accessToken,
    this.refreshToken,
    this.user,
  });
}
