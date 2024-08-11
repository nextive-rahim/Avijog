class OtpVerificationEntity {
  int? status;
  String? message;
  String? id;
  String? phone;
  String? otp;
  DateTime? createdAt;
  int? v;

  OtpVerificationEntity({
    this.status,
    this.message,
    this.id,
    this.phone,
    this.otp,
    this.createdAt,
    this.v,
  });
}
