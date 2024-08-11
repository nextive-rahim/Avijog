import 'package:obhijuk/src/features/authentication/root/domain/entities/verify_user_entity.dart';

class VerifyUserResponseModel extends VerifyUserEntity {
  VerifyUserResponseModel({
    super.message,
    super.data,
  });

  VerifyUserResponseModel copyWith({
    String? message,
    VerifyUserDataModel? data,
  }) =>
      VerifyUserResponseModel(
        message: message ?? this.message,
        data: data ?? this.data,
      );

  factory VerifyUserResponseModel.fromJson(Map<String, dynamic> json) =>
      VerifyUserResponseModel(
        message: json["message"],
        data: json["data"] == null
            ? null
            : VerifyUserDataModel.fromJson(json["data"]),
      );
}

class VerifyUserDataModel extends VerifyUserData {
  VerifyUserDataModel({
    super.exists,
    super.otp,
    super.phone,
  });

  VerifyUserDataModel copyWith({
    bool? exists,
    String? otp,
    String? phone,
  }) =>
      VerifyUserDataModel(
        exists: exists ?? this.exists,
        otp: otp ?? this.otp,
        phone: phone ?? this.phone,
      );

  factory VerifyUserDataModel.fromJson(Map<String, dynamic> json) =>
      VerifyUserDataModel(
        exists: json["exists"],
        otp: json["otp"],
        phone: json["phone"],
      );
}
