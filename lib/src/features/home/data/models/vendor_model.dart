import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';

class VendorsResponseModel {
  String? message;
  List<VendorModel>? vendors;

  VendorsResponseModel({
    this.message,
    this.vendors,
  });

  VendorsResponseModel copyWith({
    String? message,
    List<VendorModel>? vendors,
  }) =>
      VendorsResponseModel(
        message: message ?? this.message,
        vendors: vendors ?? this.vendors,
      );

  factory VendorsResponseModel.fromJson(Map<String, dynamic> json) =>
      VendorsResponseModel(
        message: json["message"],
        vendors: json["vendors"] == null
            ? []
            : List<VendorModel>.from(
                json["vendors"]!.map((x) => VendorModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "vendors": vendors == null
            ? []
            : List<dynamic>.from(vendors!.map((x) => x.toJson())),
      };
}

class VendorModel extends VendorEntity {
  VendorModel({
    super.id,
    super.name,
    super.instituteName,
    super.logo,
  });

  VendorModel copyWith({
    String? id,
    String? name,
    String? instituteName,
    String? logo,
  }) =>
      VendorModel(
        id: id ?? this.id,
        name: name ?? this.name,
        instituteName: instituteName ?? this.instituteName,
        logo: logo ?? this.logo,
      );

  factory VendorModel.fromJson(Map<String, dynamic> json) => VendorModel(
        id: json["_id"],
        name: json["name"],
        instituteName: json["institute_name"],
        logo: json["logo"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "name": name,
        "institute_name": instituteName,
        "logo": logo,
      };
}
