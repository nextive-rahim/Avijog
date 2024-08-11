import 'package:obhijuk/src/features/products/product_payment/domain/entities/payment_entity.dart';

class PaymentModel extends PaymentEntity {
  PaymentModel({
    super.paymentId,
    super.bkashUrl,
    super.callbackUrl,
    super.successCallbackUrl,
    super.failureCallbackUrl,
    super.cancelledCallbackUrl,
    super.amount,
    super.intent,
    super.currency,
    super.paymentCreateTime,
    super.transactionStatus,
    super.merchantInvoiceNumber,
    super.statusCode,
    super.statusMessage,
  });

  PaymentModel copyWith({
    String? paymentId,
    String? bkashUrl,
    String? callbackUrl,
    String? successCallbackUrl,
    String? failureCallbackUrl,
    String? cancelledCallbackUrl,
    String? amount,
    String? intent,
    String? currency,
    String? paymentCreateTime,
    String? transactionStatus,
    String? merchantInvoiceNumber,
    String? statusCode,
    String? statusMessage,
  }) =>
      PaymentModel(
        paymentId: paymentId ?? this.paymentId,
        bkashUrl: bkashUrl ?? this.bkashUrl,
        callbackUrl: callbackUrl ?? this.callbackUrl,
        successCallbackUrl: successCallbackUrl ?? this.successCallbackUrl,
        failureCallbackUrl: failureCallbackUrl ?? this.failureCallbackUrl,
        cancelledCallbackUrl: cancelledCallbackUrl ?? this.cancelledCallbackUrl,
        amount: amount ?? this.amount,
        intent: intent ?? this.intent,
        currency: currency ?? this.currency,
        paymentCreateTime: paymentCreateTime ?? this.paymentCreateTime,
        transactionStatus: transactionStatus ?? this.transactionStatus,
        merchantInvoiceNumber:
            merchantInvoiceNumber ?? this.merchantInvoiceNumber,
        statusCode: statusCode ?? this.statusCode,
        statusMessage: statusMessage ?? this.statusMessage,
      );

  factory PaymentModel.fromJson(Map<String, dynamic> json) => PaymentModel(
        paymentId: json["paymentID"],
        bkashUrl: json["bkashURL"],
        callbackUrl: json["callbackURL"],
        successCallbackUrl: json["successCallbackURL"],
        failureCallbackUrl: json["failureCallbackURL"],
        cancelledCallbackUrl: json["cancelledCallbackURL"],
        amount: json["amount"],
        intent: json["intent"],
        currency: json["currency"],
        paymentCreateTime: json["paymentCreateTime"],
        transactionStatus: json["transactionStatus"],
        merchantInvoiceNumber: json["merchantInvoiceNumber"],
        statusCode: json["statusCode"],
        statusMessage: json["statusMessage"],
      );

  Map<String, dynamic> toJson() => {
        "paymentID": paymentId,
        "bkashURL": bkashUrl,
        "callbackURL": callbackUrl,
        "successCallbackURL": successCallbackUrl,
        "failureCallbackURL": failureCallbackUrl,
        "cancelledCallbackURL": cancelledCallbackUrl,
        "amount": amount,
        "intent": intent,
        "currency": currency,
        "paymentCreateTime": paymentCreateTime,
        "transactionStatus": transactionStatus,
        "merchantInvoiceNumber": merchantInvoiceNumber,
        "statusCode": statusCode,
        "statusMessage": statusMessage,
      };
}
