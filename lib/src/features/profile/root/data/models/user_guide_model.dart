import 'package:obhijuk/src/features/profile/root/domain/entities/user_guide_entity.dart';

class UserGuideModel extends UserGuideEntity {
  UserGuideModel({
    super.content,
  });

  UserGuideModel copyWith({
    String? content,
  }) =>
      UserGuideModel(
        content: content ?? this.content,
      );

  factory UserGuideModel.fromJson(Map<String, dynamic> json) => UserGuideModel(
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
      };
}
