import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/show_error_message_provider.dart';
import 'package:obhijuk/src/features/products/product_payment/data/models/initiate_payment_payload_model.dart';
import 'package:obhijuk/src/features/products/product_payment/domain/entities/payment_entity.dart';
import 'package:obhijuk/src/features/products/product_payment/domain/use_cases/initiate_payment_use_case.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'initiate_payment_provider.g.dart';

@Riverpod()
class InitiatePayment extends _$InitiatePayment {
  @override
  Future<PaymentEntity?> build() async {
    return null;
  }

  Future<PaymentEntity?> initiatePayment({
    required InitiatePaymentPayloadModel paymentPayload,
    required PaymentMethod paymentMethod,
  }) async {
    final initiatePaymentUseCase = ref.read(
      initiatePaymentUseCaseProvider(
        body: paymentPayload.toJson(),
        paymentMethod: paymentMethod,
      ),
    );

    state = const AsyncValue.loading();

    ErrorModel? errorModel;
    PaymentEntity? paymentEntity;

    (errorModel, paymentEntity) = await initiatePaymentUseCase();

    if (errorModel != null) {
      ref.read(showErrorMessageProvider.notifier).errorMessage(
            errorModel.message ?? 'Something went wrong',
          );
      state = AsyncError(errorModel, StackTrace.current);
      throw errorModel;
    } else {
      state = AsyncData(paymentEntity);
      return paymentEntity;
    }
  }
}
