import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/data/data_sources/home_data_source.dart';
import 'package:obhijuk/src/features/home/data/repository/home_repository_impl.dart';
import 'package:obhijuk/src/features/home/domain/entities/balance_entity.dart';
import 'package:obhijuk/src/features/home/domain/entities/banner_entity.dart';
import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository.g.dart';

@Riverpod()
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl(
    dataSource: ref.read(homeDataSourceProvider),
  );
}

abstract class HomeRepository {
  Future<(ErrorModel?, List<VendorEntity>?)> getVendors();
  Future<(ErrorModel?, BalanceEntity?)> getBalance();
  Future<(ErrorModel?, List<BannerEntity>?)> getBanners();
}
