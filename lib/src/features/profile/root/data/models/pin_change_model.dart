import 'package:obhijuk/src/features/profile/root/domain/entities/pin_change_entity.dart';

class PinChangeModel extends PinChangeEntity {
  PinChangeModel({
    super.message,
  });

  factory PinChangeModel.fromJson(Map<String, dynamic> json) => PinChangeModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
