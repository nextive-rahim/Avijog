part of '../../domain/repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  ProductRepositoryImpl({required this.dataSource});
  final ProductDataSource dataSource;

  @override
  Future<(ErrorModel?, List<ProductEntity>?)> getProducts({
    String? vendorId,
  }) async {
    return await dataSource.fetchProducts(vendorId: vendorId).guard(
          (data) => ProductsResponseModel.fromJson(data).products,
        );
  }

  @override
  Future<(ErrorModel?, ProductEntity?)> getProduct(
      {required String productId}) {
    return dataSource.fetchProduct(productId: productId).guard(
          (data) => ProductDetailsResponseModel.fromJson(data).product,
        );
  }
}
