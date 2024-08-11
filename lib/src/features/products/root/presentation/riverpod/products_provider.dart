import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/domain/use_cases/get_products_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'products_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<ProductEntity>> products(
  ProductsRef ref, {
  String? vendorId,
}) async {
  final getProducts = ref.read(getProductsUseCaseProvider(vendorId: vendorId));

  ErrorModel? errorModel;
  List<ProductEntity>? products;

  (errorModel, products) = await getProducts();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return products ?? [];
  }
}
