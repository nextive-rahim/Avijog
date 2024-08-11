import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:obhijuk/src/features/products/product_payment/data/models/initiate_payment_payload_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_payment_data_source.g.dart';
part 'product_payment_data_source_impl.dart';

@Riverpod()
ProductPaymentDataSource productPaymentDataSource(
    ProductPaymentDataSourceRef ref) {
  return ProductPaymentDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}

abstract class ProductPaymentDataSource {
  Future<Response> initiatePayment({
    required Map<String, dynamic> body,
    required PaymentMethod paymentMethod,
  });
}
