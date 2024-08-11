import 'package:obhijuk/src/features/payment_history/data/models/payment_history_model.dart';

class HistoryEntity {
  String? id;
  Product? product;
  Vendor? vendor;
  String? user;
  dynamic amount;
  dynamic comission;
  String? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  String? orderId;
  String? clientName;
  String? clientPhone;
  HistoryEntity({
    this.id,
    this.product,
    this.vendor,
    this.user,
    this.amount,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.comission,
    this.clientName,
    this.clientPhone,
    this.orderId,
  });
}
