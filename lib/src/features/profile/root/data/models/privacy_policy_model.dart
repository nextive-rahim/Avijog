import 'package:obhijuk/src/features/profile/root/domain/entities/privacy_policy_entity.dart';

class PrivacyPolicyModel extends PrivacyPolicyEntity {
  PrivacyPolicyModel({
    super.content,
  });

  PrivacyPolicyModel copyWith({
    String? content,
  }) =>
      PrivacyPolicyModel(
        content: content ?? this.content,
      );

  factory PrivacyPolicyModel.fromJson(Map<String, dynamic> json) =>
      PrivacyPolicyModel(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
