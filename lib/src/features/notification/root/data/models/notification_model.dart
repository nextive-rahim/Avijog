// To parse this JSON data, do
//
//     final notificationModel = notificationModelFromJson(jsonString);

import 'dart:convert';

import 'package:obhijuk/src/features/notification/root/domain/entities/notification_entity.dart';

List<NotificationModel> notificationModelFromJson(String str) =>
    List<NotificationModel>.from(
        json.decode(str).map((x) => NotificationModel.fromJson(x)));

String notificationModelToJson(List<NotificationModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NotificationModel extends NotificationEntity {
  NotificationModel({
    super.id,
    super.title,
    super.body,
    super.image,
    super.link,
    super.type,
    super.createdAt,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) =>
      NotificationModel(
        id: json["_id"],
        title: json["title"],
        body: json["body"],
        image: json["image"],
        link: json["link"],
        type: json["type"],
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "title": title,
        "body": body,
        "image": image,
        "link": link,
        "type": type,
        "createdAt": createdAt!.toIso8601String(),
      };
}
