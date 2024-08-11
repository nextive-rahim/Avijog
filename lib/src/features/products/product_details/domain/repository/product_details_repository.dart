import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/product_details/data/data_sources/product_details_data_source.dart';
import 'package:obhijuk/src/features/products/product_details/data/models/customer_verification_model.dart';
import 'package:obhijuk/src/features/products/product_details/domain/entities/customer_verification_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../data/repository/product_details_repository_impl.dart';
part 'product_details_repository.g.dart';

@Riverpod()
ProductDetailsRepository productDetailsRepository(
    ProductDetailsRepositoryRef ref) {
  return ProductDetailsRepositoryImpl(
    dataSource: ref.read(productDetailsDataSourceProvider),
  );
}

abstract class ProductDetailsRepository {
  Future<(ErrorModel?, CustomerVerificationEntity?)> verifyCustomer({
    required Map<String, dynamic> body,
  });
}
