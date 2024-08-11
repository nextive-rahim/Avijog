import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/domain/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_products_use_case.g.dart';

@Riverpod()
GetProductsUseCase getProductsUseCase(GetProductsUseCaseRef ref,
    {String? vendorId}) {
  return GetProductsUseCase(
    vendorId: vendorId,
    repository: ref.read(productRepositoryProvider),
  );
}

class GetProductsUseCase {
  GetProductsUseCase({
    required this.repository,
    this.vendorId,
  });
  final ProductRepository repository;
  final String? vendorId;

  Future<(ErrorModel?, List<ProductEntity>?)> call() async {
    return await repository.getProducts(vendorId: vendorId);
  }
}
