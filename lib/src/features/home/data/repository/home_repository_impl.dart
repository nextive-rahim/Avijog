import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/data/data_sources/home_data_source.dart';
import 'package:obhijuk/src/features/home/data/models/balance_model.dart';
import 'package:obhijuk/src/features/home/data/models/banner_model.dart';
import 'package:obhijuk/src/features/home/data/models/vendor_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/balance_entity.dart';
import 'package:obhijuk/src/features/home/domain/entities/banner_entity.dart';
import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';
import 'package:obhijuk/src/features/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {
  HomeRepositoryImpl({required this.dataSource});
  final HomeDataSource dataSource;

  @override
  Future<(ErrorModel?, List<VendorEntity>?)> getVendors() async {
    return await dataSource.fetchVendors().guard(
          (data) => VendorsResponseModel.fromJson(data).vendors,
        );
  }

  @override
  Future<(ErrorModel?, BalanceEntity?)> getBalance() async {
    return await dataSource.fetchBalance().guard(
          (data) => BalanceModel.fromJson(data),
        );
  }

  @override
  Future<(ErrorModel?, List<BannerEntity>?)> getBanners() async {
    return await dataSource.fetchBanners().guard(
          (data) => BannersResponseModel.fromJson(data).banners,
        );
  }
}
