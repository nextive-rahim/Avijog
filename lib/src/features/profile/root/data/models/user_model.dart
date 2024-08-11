import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';

class UserResponseModel {
  String? message;
  UserModel? user;

  UserResponseModel({
    this.message,
    this.user,
  });

  UserResponseModel copyWith({
    String? message,
    UserModel? user,
  }) =>
      UserResponseModel(
        message: message ?? this.message,
        user: user ?? this.user,
      );

  factory UserResponseModel.fromJson(Map<String, dynamic> json) =>
      UserResponseModel(
        message: json["message"],
        user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
      );
}

class UserModel extends UserEntity {
  UserModel({
    super.id,
    super.name,
    super.userEntityClass,
    super.institute,
    super.phone,
    super.nid,
    super.address,
    super.reference,
    super.fcmTokens,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        name: json["name"],
        userEntityClass: json["class"],
        institute: json["institute"],
        phone: json["phone"],
        nid: json["nid"],
        address: json["address"],
        reference: json["reference"],
        fcmTokens: (json["fcm_tokens"] == null || json["fcm_tokens"] == []) ||
                json["fcm_tokens"].every((token) => token == null)
            ? []
            : List<String>.from(json["fcm_tokens"]!.map((x) => x)),
      );
}
