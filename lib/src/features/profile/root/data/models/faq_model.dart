// To parse this JSON data, do
//
//     final faqResponseModel = faqResponseModelFromJson(jsonString);

import 'dart:convert';

import 'package:obhijuk/src/features/profile/root/domain/entities/faq_entity.dart';

FaqResponseModel faqResponseModelFromJson(String str) =>
    FaqResponseModel.fromJson(json.decode(str));

class FaqResponseModel {
  List<FaqModel>? data;

  FaqResponseModel({
    this.data,
  });

  factory FaqResponseModel.fromJson(Map<String, dynamic> json) =>
      FaqResponseModel(
        data:
            List<FaqModel>.from(json["data"].map((x) => FaqModel.fromJson(x))),
      );
}

class FaqModel extends FaqEntity {
  FaqModel({
    super.question,
    super.answer,
  });

  factory FaqModel.fromJson(Map<String, dynamic> json) => FaqModel(
        question: json["question"],
        answer: json["answer"],
      );
}
