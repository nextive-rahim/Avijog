import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/product_payment/data/models/initiate_payment_payload_model.dart';
import 'package:obhijuk/src/features/products/product_payment/domain/entities/payment_entity.dart';
import 'package:obhijuk/src/features/products/product_payment/domain/repository/product_payment_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initiate_payment_use_case.g.dart';

@Riverpod()
InitiatePaymentUseCase initiatePaymentUseCase(
  InitiatePaymentUseCaseRef ref, {
  required Map<String, dynamic> body,
  required PaymentMethod paymentMethod,
}) {
  return InitiatePaymentUseCase(
    body: body,
    repository: ref.read(productPaymentRepositoryProvider),
    paymentMethod: paymentMethod,
  );
}

class InitiatePaymentUseCase {
  InitiatePaymentUseCase({
    required this.repository,
    required this.body,
    required this.paymentMethod,
  });
  final ProductPaymentRepository repository;
  final Map<String, dynamic> body;
  final PaymentMethod paymentMethod;

  Future<(ErrorModel?, PaymentEntity?)> call() async {
    return await repository.initiatePayment(
      body: body,
      paymentMethod: paymentMethod,
    );
  }
}
