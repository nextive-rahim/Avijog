part of '../../domain/repository/product_details_repository.dart';

class ProductDetailsRepositoryImpl implements ProductDetailsRepository {
  ProductDetailsRepositoryImpl({required this.dataSource});
  final ProductDetailsDataSource dataSource;

  @override
  Future<(ErrorModel?, CustomerVerificationEntity?)> verifyCustomer({
    required Map<String, dynamic> body,
  }) async {
    return await dataSource.verifyCustomer(body: body).guard(
          (data) => CustomerVerificationResponseModel.fromJson(data).data,
        );
  }
}
