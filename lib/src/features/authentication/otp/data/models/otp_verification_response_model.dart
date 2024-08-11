import 'package:obhijuk/src/features/authentication/otp/domain/entities/otp_verification_entity.dart';

class OtpVerificationResponseModel extends OtpVerificationEntity {
  OtpVerificationResponseModel({
    super.status,
    super.message,
    super.id,
    super.phone,
    super.otp,
    super.createdAt,
    super.v,
  });

  OtpVerificationResponseModel copyWith({
    int? status,
    String? message,
    String? id,
    String? phone,
    String? otp,
    DateTime? createdAt,
    int? v,
  }) =>
      OtpVerificationResponseModel(
        status: status ?? this.status,
        message: message ?? this.message,
        id: id ?? this.id,
        phone: phone ?? this.phone,
        otp: otp ?? this.otp,
        createdAt: createdAt ?? this.createdAt,
        v: v ?? this.v,
      );

  factory OtpVerificationResponseModel.fromJson(Map<String, dynamic> json) =>
      OtpVerificationResponseModel(
        status: json["status"],
        message: json["message"],
        id: json["_id"],
        phone: json["phone"],
        otp: json["otp"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "_id": id,
        "phone": phone,
        "otp": otp,
        "created_at": createdAt?.toIso8601String(),
        "__v": v,
      };
}
