import 'package:obhijuk/src/features/authentication/root/domain/entities/authentication_entity.dart';
import 'package:obhijuk/src/features/profile/root/data/models/user_model.dart';

class AuthenticationResponseModel extends AuthenticationEntity {
  AuthenticationResponseModel({
    super.message,
    super.accessToken,
    super.refreshToken,
    super.user,
  });

  AuthenticationResponseModel copyWith({
    String? message,
    String? accessToken,
    String? refreshToken,
    UserModel? user,
  }) =>
      AuthenticationResponseModel(
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
        refreshToken: refreshToken ?? this.refreshToken,
        user: user ?? this.user,
      );

  factory AuthenticationResponseModel.fromJson(Map<String, dynamic> json) =>
      AuthenticationResponseModel(
        message: json["message"],
        accessToken: json["access_token"],
        refreshToken: json["refresh_token"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );
}
