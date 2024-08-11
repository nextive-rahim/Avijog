import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/app_dialog.dart';
import 'package:obhijuk/src/core/widgets/button.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/core/widgets/form_validation.dart';
import 'package:obhijuk/src/core/widgets/gobal_snack_bar.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/features/products/product_details/data/models/verify_customer_payload_model.dart';
import 'package:obhijuk/src/features/products/product_details/presentation/riverpod/selected_product_provider.dart';
import 'package:obhijuk/src/features/products/product_details/presentation/riverpod/selling_price_provider.dart';
import 'package:obhijuk/src/features/products/product_details/presentation/riverpod/verify_customer_provider.dart';
import 'package:obhijuk/src/features/products/product_payment/data/models/initiate_payment_payload_model.dart';
import 'package:obhijuk/src/features/products/product_payment/presentation/riverpod/initiate_payment_provider.dart';
import 'package:obhijuk/src/features/products/product_payment/presentation/riverpod/payment_callback_provider.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/presentation/riverpod/product_details_provider.dart';
import 'package:obhijuk/src/features/products/root/presentation/widgets/product_price.dart';
import 'package:obhijuk/src/features/profile/root/presentation/riverpod/user_provider.dart';
import 'package:readmore/readmore.dart';

part '../widgets/calculate_commission.dart';
part '../widgets/product_description.dart';
part '../widgets/product_details_header.dart';
part '../widgets/user_verification_bottom_sheet.dart';

class ProductDetailsPage extends ConsumerWidget {
  const ProductDetailsPage({
    super.key,
    required this.productId,
    this.productName,
  });
  final String productId;
  final String? productName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncProduct =
        ref.watch(productDetailsProvider(productId: productId));

    ref.listen(paymentCallbackProvider, (previous, next) {
      if (next?.contains('status=success') ?? false) {
        WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
          appDialog(
            context: context,
            title: 'Payment Successful',
            description: 'Your payment is successfully done.',
            yesButtonText: 'Done',
            showNoButton: false,
            isDismissible: false,
            icon: Assets.success.path,
            onYesPressed: () {
              ref.read(paymentCallbackProvider.notifier).state = null;
              context.pop();
            },
          );
        });
      }

      if (next?.contains('status=failure') ?? false) {
        GlobalSnackBar.show(
          context,
          'Payment failed, please try again',
        );
      }

      if (next?.contains('status=cancel') ?? false) {
        GlobalSnackBar.show(
          context,
          'Payment cancelled.',
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text(
          productName ?? '',
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: asyncProduct.when(
            data: (product) {
              Future.delayed(Duration.zero, () {
                ref.read(selectedProductProvider.notifier).state = product;
              });

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProductDetailsHeader(product: product),
                  _ProductDescription(product: product),
                  _CalculateCommission(product: product),
                ],
              );
            },
            loading: () {
              return _buildLoadingWidget();
            },
            error: (error, stackTrace) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Error: ${error.toString()}',
                      style: const TextStyle(
                        color: AppColors.red,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        ref.invalidate(
                          productDetailsProvider(productId: productId),
                        );
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 16 / 9,
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.lighterBlue,
                borderRadius: BorderRadius.circular(15),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: AppColors.lighterBlue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 20),
          Container(
            height: 150,
            width: 250,
            decoration: BoxDecoration(
              color: AppColors.lighterBlue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          const SizedBox(height: 40),
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: AppColors.lighterBlue,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
        ],
      ),
    );
  }
}
