class VerifyUserEntity {
  String? message;
  VerifyUserData? data;

  VerifyUserEntity({
    this.message,
    this.data,
  });
}

class VerifyUserData {
  bool? exists;
  String? otp;
  String? phone;

  VerifyUserData({
    this.exists,
    this.otp,
    this.phone,
  });
}
