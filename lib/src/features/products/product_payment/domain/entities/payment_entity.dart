class PaymentEntity {
  String? paymentId;
  String? bkashUrl;
  String? callbackUrl;
  String? successCallbackUrl;
  String? failureCallbackUrl;
  String? cancelledCallbackUrl;
  String? amount;
  String? intent;
  String? currency;
  String? paymentCreateTime;
  String? transactionStatus;
  String? merchantInvoiceNumber;
  String? statusCode;
  String? statusMessage;

  PaymentEntity({
    this.paymentId,
    this.bkashUrl,
    this.callbackUrl,
    this.successCallbackUrl,
    this.failureCallbackUrl,
    this.cancelledCallbackUrl,
    this.amount,
    this.intent,
    this.currency,
    this.paymentCreateTime,
    this.transactionStatus,
    this.merchantInvoiceNumber,
    this.statusCode,
    this.statusMessage,
  });
}
