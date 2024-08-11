import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/products/root/data/data_sources/product_data_source.dart';
import 'package:obhijuk/src/features/products/root/data/models/product_model.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part '../../data/repository/product_repository_impl.dart';
part 'product_repository.g.dart';

@Riverpod()
ProductRepository productRepository(ProductRepositoryRef ref) {
  return ProductRepositoryImpl(
    dataSource: ref.read(productDataSourceProvider),
  );
}

abstract class ProductRepository {
  Future<(ErrorModel?, List<ProductEntity>?)> getProducts({String? vendorId});
  Future<(ErrorModel?, ProductEntity?)> getProduct({required String productId});
}
