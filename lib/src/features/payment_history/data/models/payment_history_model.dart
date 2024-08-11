import 'dart:convert';

import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';
import 'package:obhijuk/src/features/payment_history/domain/entities/payment_history_entity.dart';
import 'package:obhijuk/src/features/payment_history/domain/entities/selling_product_entity.dart';

PaymentHistoryResponseModel historyResponseModelFromJson(String str) =>
    PaymentHistoryResponseModel.fromJson(json.decode(str));

class PaymentHistoryResponseModel {
  List<PaymentHistoryModel>? data;

  PaymentHistoryResponseModel({
    this.data,
  });

  factory PaymentHistoryResponseModel.fromJson(Map<String, dynamic> json) =>
      PaymentHistoryResponseModel(
        data: json["data"] == null
            ? []
            : List<PaymentHistoryModel>.from(
                json["data"].map((x) => PaymentHistoryModel.fromJson(x))),
      );
}

class PaymentHistoryModel extends HistoryEntity {
  PaymentHistoryModel({
    super.id,
    super.product,
    super.vendor,
    super.user,
    super.amount,
    super.status,
    super.createdAt,
    super.updatedAt,
    super.comission,
    super.clientName,
    super.clientPhone,
    super.orderId,
  });

  factory PaymentHistoryModel.fromJson(Map<String, dynamic> json) =>
      PaymentHistoryModel(
        id: json["_id"],
        product:
            json["product"] == null ? null : Product.fromJson(json["product"]),
        vendor: json["vendor"] == null ? null : Vendor.fromJson(json["vendor"]),
        user: json["user"],
        amount: json["sale_price"],
        status: json["status"],
        createdAt: json["createdAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["createdAt"]),
        updatedAt: json["updatedAt"] == null
            ? DateTime.now()
            : DateTime.parse(json["updatedAt"]),
        comission: json["comission"] ?? 0,
        clientName: json["client_name"] ?? 'N/A',
        clientPhone: json["client_phone"] ?? 'N/A',
        orderId: json["orderId"] ?? '',
      );
}

class Product extends SellingProductEntity {
  Product({
    super.id,
    super.name,
    super.image,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        name: json["name"],
        image: json["image"],
      );
}

class Vendor extends VendorEntity {
  Vendor({
    super.id,
    super.name,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) => Vendor(
        id: json["_id"],
        name: json["name"],
      );
}
