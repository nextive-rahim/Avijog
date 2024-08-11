import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/domain/repository/product_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_product_details_use_case.g.dart';

@Riverpod()
GetProductDetailsUseCase getProductDetailsUseCase(
    GetProductDetailsUseCaseRef ref,
    {required String productId}) {
  return GetProductDetailsUseCase(
    productId: productId,
    repository: ref.read(productRepositoryProvider),
  );
}

class GetProductDetailsUseCase {
  GetProductDetailsUseCase({
    required this.repository,
    required this.productId,
  });
  final ProductRepository repository;
  final String productId;

  Future<(ErrorModel?, ProductEntity?)> call() async {
    return await repository.getProduct(productId: productId);
  }
}
