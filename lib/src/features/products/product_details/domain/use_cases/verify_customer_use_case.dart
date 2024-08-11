import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/product_details/domain/entities/customer_verification_entity.dart';
import 'package:obhijuk/src/features/products/product_details/domain/repository/product_details_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_customer_use_case.g.dart';

@Riverpod()
VerifyCustomerUseCase verifyCustomerUseCase(
  VerifyCustomerUseCaseRef ref, {
  required Map<String, dynamic> body,
}) {
  return VerifyCustomerUseCase(
    body: body,
    repository: ref.read(productDetailsRepositoryProvider),
  );
}

class VerifyCustomerUseCase {
  VerifyCustomerUseCase({
    required this.repository,
    required this.body,
  });
  final ProductDetailsRepository repository;
  final Map<String, dynamic> body;

  Future<(ErrorModel?, CustomerVerificationEntity?)> call() async {
    return await repository.verifyCustomer(body: body);
  }
}
