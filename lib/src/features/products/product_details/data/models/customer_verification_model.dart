import 'package:obhijuk/src/features/products/product_details/domain/entities/customer_verification_entity.dart';

class CustomerVerificationResponseModel {
  int? status;
  CustomerVerificationModel? data;

  CustomerVerificationResponseModel({
    this.status,
    this.data,
  });

  CustomerVerificationResponseModel copyWith({
    int? status,
    CustomerVerificationModel? data,
  }) =>
      CustomerVerificationResponseModel(
        status: status ?? this.status,
        data: data ?? this.data,
      );

  factory CustomerVerificationResponseModel.fromJson(
          Map<String, dynamic> json) =>
      CustomerVerificationResponseModel(
        status: json["status"],
        data: json["data"] == null
            ? null
            : CustomerVerificationModel.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "data": data?.toJson(),
      };
}

class CustomerVerificationModel extends CustomerVerificationEntity {
  CustomerVerificationModel({
    super.exists,
    super.name,
    super.webview,
    super.closing,
  });

  CustomerVerificationModel copyWith({
    bool? exists,
    String? name,
    String? webview,
    String? closing,
  }) =>
      CustomerVerificationModel(
        exists: exists ?? this.exists,
        name: name ?? this.name,
        webview: webview ?? this.webview,
        closing: closing ?? this.closing,
      );

  factory CustomerVerificationModel.fromJson(Map<String, dynamic> json) =>
      CustomerVerificationModel(
        exists: json["exists"],
        name: json["name"],
        webview: json["webview"],
        closing: json["closing"],
      );

  Map<String, dynamic> toJson() => {
        "exists": exists,
        "name": name,
        "webview": webview,
        "closing": closing,
      };
}
