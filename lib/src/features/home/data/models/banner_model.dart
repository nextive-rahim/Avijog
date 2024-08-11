import 'package:obhijuk/src/features/home/domain/entities/banner_entity.dart';

class BannersResponseModel {
  String? message;
  List<BannerModel>? banners;

  BannersResponseModel({
    this.message,
    this.banners,
  });

  BannersResponseModel copyWith({
    String? message,
    List<BannerModel>? banners,
  }) =>
      BannersResponseModel(
        message: message ?? this.message,
        banners: banners ?? this.banners,
      );

  factory BannersResponseModel.fromJson(Map<String, dynamic> json) =>
      BannersResponseModel(
        message: json["message"],
        banners: json["banners"] == null
            ? []
            : List<BannerModel>.from(
                json["banners"]!.map((x) => BannerModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "banners": banners == null
            ? []
            : List<dynamic>.from(banners!.map((x) => x.toJson())),
      };
}

class BannerModel extends BannerEntity {
  BannerModel({
    super.id,
    super.image,
    super.link,
  });

  BannerModel copyWith({
    String? id,
    String? image,
    String? link,
  }) =>
      BannerModel(
        id: id ?? this.id,
        image: image ?? this.image,
        link: link ?? this.link,
      );

  factory BannerModel.fromJson(Map<String, dynamic> json) => BannerModel(
        id: json["_id"],
        image: json["image"],
        link: json["link"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "image": image,
        "link": link,
      };
}
