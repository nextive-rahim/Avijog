import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';
import 'package:obhijuk/src/features/home/domain/use_cases/get_vendors_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_vendors_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<VendorEntity>> allVendors(AllVendorsRef ref) async {
  final getVendorsUseCase = ref.read(getVendorsUseCaseProvider);

  ErrorModel? errorModel;
  List<VendorEntity>? vendors;

  (errorModel, vendors) = await getVendorsUseCase();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return vendors ?? [];
  }
}
