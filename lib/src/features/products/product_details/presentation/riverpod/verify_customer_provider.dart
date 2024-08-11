import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/show_error_message_provider.dart';
import 'package:obhijuk/src/features/products/product_details/data/models/verify_customer_payload_model.dart';
import 'package:obhijuk/src/features/products/product_details/domain/entities/customer_verification_entity.dart';
import 'package:obhijuk/src/features/products/product_details/domain/use_cases/verify_customer_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'verify_customer_provider.g.dart';

@Riverpod()
class VerifyCustomer extends _$VerifyCustomer {
  @override
  Future<CustomerVerificationEntity?> build() async {
    return null;
  }

  VerifyCustomerPayloadModel? customerToVerify;

  Future<CustomerVerificationEntity?> verify({
    required VerifyCustomerPayloadModel customerInfo,
  }) async {
    final verifyUseCase = ref.read(
      verifyCustomerUseCaseProvider(body: customerInfo.toJson()),
    );

    state = const AsyncValue.loading();

    customerToVerify = customerInfo;

    ErrorModel? errorModel;
    CustomerVerificationEntity? customerVerificationEntity;

    (errorModel, customerVerificationEntity) = await verifyUseCase();

    if (errorModel != null) {
      ref.read(showErrorMessageProvider.notifier).errorMessage(
            errorModel.message ?? 'Something went wrong',
          );

      state = AsyncError(errorModel, StackTrace.current);

      throw errorModel;
    } else {
      state = AsyncData(customerVerificationEntity);
      return customerVerificationEntity;
    }
  }

  Future<CustomerVerificationEntity?> reVerify() async {
    if (customerToVerify == null) {
      return null;
    }

    final verifyUseCase = ref.read(
      verifyCustomerUseCaseProvider(body: customerToVerify!.toJson()),
    );

    state = const AsyncValue.loading();

    ErrorModel? errorModel;
    CustomerVerificationEntity? customerVerificationEntity;

    (errorModel, customerVerificationEntity) = await verifyUseCase();

    if (errorModel != null) {
      ref.read(showErrorMessageProvider.notifier).errorMessage(
            errorModel.message ?? 'Something went wrong',
          );

      state = AsyncError(errorModel, StackTrace.current);

      throw errorModel;
    } else {
      state = AsyncData(customerVerificationEntity);
      return customerVerificationEntity;
    }
  }
}
