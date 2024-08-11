import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/product_payment/data/data_sources/product_payment_data_source.dart';
import 'package:obhijuk/src/features/products/product_payment/data/models/initiate_payment_payload_model.dart';
import 'package:obhijuk/src/features/products/product_payment/data/models/payment_model.dart';
import 'package:obhijuk/src/features/products/product_payment/domain/entities/payment_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../data/repository/product_payment_repository_impl.dart';
part 'product_payment_repository.g.dart';

@Riverpod()
ProductPaymentRepository productPaymentRepository(
    ProductPaymentRepositoryRef ref) {
  return ProductPaymentRepositoryImpl(
    dataSource: ref.read(productPaymentDataSourceProvider),
  );
}

abstract class ProductPaymentRepository {
  Future<(ErrorModel?, PaymentEntity?)> initiatePayment({
    required Map<String, dynamic> body,
    required PaymentMethod paymentMethod,
  });
}
