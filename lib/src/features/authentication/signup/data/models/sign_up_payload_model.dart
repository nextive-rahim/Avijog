import 'package:obhijuk/src/features/authentication/signup/domain/entities/sign_up_payload_entity.dart';

class SignUpPayloadModel extends SignUpPayloadEntity {
  SignUpPayloadModel({
    super.name,
    super.studyLevelClass,
    super.institute,
    super.phone,
    super.password,
    super.nid,
    super.address,
    super.reference,
    super.fcmToken,
  });

  SignUpPayloadModel copyWith({
    String? name,
    String? studyLabelClass,
    String? institute,
    String? phone,
    String? password,
    String? nid,
    String? address,
    String? reference,
    String? fcmToken,
  }) =>
      SignUpPayloadModel(
        name: name ?? this.name,
        studyLevelClass: studyLabelClass ?? studyLabelClass,
        institute: institute ?? this.institute,
        phone: phone ?? this.phone,
        password: password ?? this.password,
        nid: nid ?? this.nid,
        address: address ?? this.address,
        reference: reference ?? this.reference,
        fcmToken: fcmToken ?? this.fcmToken,
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "class": studyLevelClass,
        "institute": institute,
        "phone": phone,
        "password": password,
        "address": address,
        if (reference != null) "reference": reference,
        if (fcmToken != null) "fcm_token": fcmToken,
      };

  factory SignUpPayloadModel.fromEntity(SignUpPayloadEntity entity) {
    return SignUpPayloadModel(
      name: entity.name,
      studyLevelClass: entity.studyLevelClass,
      institute: entity.institute,
      phone: entity.phone,
      password: entity.password,
      nid: entity.nid,
      address: entity.address,
      reference: entity.reference,
      fcmToken: entity.fcmToken,
    );
  }
}
