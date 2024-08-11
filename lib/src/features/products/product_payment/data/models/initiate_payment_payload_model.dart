enum PaymentMethod { bkash, sslCommerz, nagad }

class InitiatePaymentPayloadModel {
  String? vendorId;
  String? productId;
  double? salePrice;
  String? clientName;
  String? clientPhone;

  InitiatePaymentPayloadModel({
    this.vendorId,
    this.productId,
    this.salePrice,
    this.clientName,
    this.clientPhone,
  });

  InitiatePaymentPayloadModel copyWith({
    String? vendorId,
    String? productId,
    double? salePrice,
    String? clientName,
    String? clientPhone,
  }) =>
      InitiatePaymentPayloadModel(
        vendorId: vendorId ?? this.vendorId,
        productId: productId ?? this.productId,
        salePrice: salePrice ?? this.salePrice,
        clientName: clientName ?? this.clientName,
        clientPhone: clientPhone ?? this.clientPhone,
      );

  factory InitiatePaymentPayloadModel.fromJson(Map<String, dynamic> json) =>
      InitiatePaymentPayloadModel(
        vendorId: json["vendorId"],
        productId: json["productId"],
        salePrice: json["sale_price"],
        clientName: json["client_name"],
        clientPhone: json["client_phone"],
      );

  Map<String, dynamic> toJson() => {
        "vendorId": vendorId,
        "productId": productId,
        "sale_price": salePrice,
        "client_name": clientName,
        "client_phone": clientPhone,
      };
}
