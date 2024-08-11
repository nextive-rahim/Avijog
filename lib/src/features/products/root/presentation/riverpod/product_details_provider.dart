import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/domain/use_cases/get_product_details_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'product_details_provider.g.dart';

@Riverpod(keepAlive: true)
Future<ProductEntity?> productDetails(
  ProductDetailsRef ref, {
  required String productId,
}) async {
  final getProductDetails =
      ref.read(getProductDetailsUseCaseProvider(productId: productId));

  ErrorModel? errorModel;
  ProductEntity? product;

  (errorModel, product) = await getProductDetails();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return product;
  }
}
