import 'package:obhijuk/src/features/authentication/forget_password/domain/entities/forgot_password_entity.dart';

class ForgotPasswordResponseModel extends ForgotPasswordEntity {
  ForgotPasswordResponseModel({
    super.status,
    super.message,
  });

  ForgotPasswordResponseModel copyWith({
    int? status,
    String? message,
  }) =>
      ForgotPasswordResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
      );

  factory ForgotPasswordResponseModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordResponseModel(
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
      };
}
