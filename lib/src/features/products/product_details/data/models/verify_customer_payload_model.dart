class VerifyCustomerPayloadModel {
  String? vendorId;
  String? productId;
  String? phone;

  VerifyCustomerPayloadModel({
    this.vendorId,
    this.productId,
    this.phone,
  });

  VerifyCustomerPayloadModel copyWith({
    String? vendorId,
    String? productId,
    String? phone,
  }) =>
      VerifyCustomerPayloadModel(
        vendorId: vendorId ?? this.vendorId,
        productId: productId ?? this.productId,
        phone: phone ?? this.phone,
      );

  factory VerifyCustomerPayloadModel.fromJson(Map<String, dynamic> json) =>
      VerifyCustomerPayloadModel(
        vendorId: json["vendorId"],
        productId: json["productId"],
        phone: json["phone"],
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "productId": productId,
        "phone": phone,
      };
}
