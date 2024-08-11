part of '../../domain/repository/product_payment_repository.dart';

class ProductPaymentRepositoryImpl implements ProductPaymentRepository {
  ProductPaymentRepositoryImpl({required this.dataSource});
  final ProductPaymentDataSource dataSource;

  @override
  Future<(ErrorModel?, PaymentEntity?)> initiatePayment({
    required Map<String, dynamic> body,
    required PaymentMethod paymentMethod,
  }) async {
    return await dataSource
        .initiatePayment(
          body: body,
          paymentMethod: paymentMethod,
        )
        .guard(
          (data) => PaymentModel.fromJson(data),
        );
  }
}
