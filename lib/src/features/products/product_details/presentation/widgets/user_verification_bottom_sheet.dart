part of '../pages/product_details_page.dart';

void _userVerificationBottomSheet(BuildContext context) {
  showModalBottomSheet<void>(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return const _UserVerification();
    },
  );
}

class _UserVerification extends ConsumerStatefulWidget {
  const _UserVerification({
    super.key,
  });

  @override
  ConsumerState<_UserVerification> createState() => _UserVerificationState();
}

class _UserVerificationState extends ConsumerState<_UserVerification> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _phoneNumberController = TextEditingController();
  String? phoneNumber;

  @override
  Widget build(BuildContext context) {
    final customerVerification = ref.watch(verifyCustomerProvider);
    final customerVerificationNotifier =
        ref.watch(verifyCustomerProvider.notifier);

    final user = ref.watch(userProvider).maybeWhen(
          orElse: () => null,
          data: (data) {
            return data;
          },
        );

    return Padding(
      padding: const EdgeInsets.all(20.0).copyWith(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        constraints: const BoxConstraints(
          maxHeight: 400,
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Image.asset(
                Assets.alert.path,
                height: 56,
                width: 56,
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.verificationCheck,
                style: AppTextStyle.bold22,
              ),
              Text(
                AppLocalizations.of(context)!.verificationSubTitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.regular12,
              ),
              Form(
                key: _formKey,
                child: OutlinedInputField(
                  controller: _phoneNumberController,
                  hintText: AppLocalizations.of(context)!.phoneNunber,
                  fillColor: AppColors.lighterBlue,
                  borderColor: AppColors.primary,
                  keyboardType: TextInputType.phone,
                  textInputAction: TextInputAction.search,
                  onSubmitted: (val) async {
                    VerifyCustomerPayloadModel customerInfo =
                        VerifyCustomerPayloadModel(
                      productId: ref.watch(selectedProductProvider)?.id,
                      vendorId: user?.id,
                      phone: _phoneNumberController.text,
                    );

                    if (!_formKey.currentState!.validate()) {
                      return;
                    }

                    await customerVerificationNotifier
                        .verify(
                      customerInfo: customerInfo,
                    )
                        .then((value) {
                      phoneNumber = _phoneNumberController.text;
                    });
                  },
                  suffix: customerVerification is AsyncLoading<void>
                      ? const CupertinoActivityIndicator(
                          radius: 8,
                          color: AppColors.primary,
                        )
                      : GestureDetector(
                          onTap: () async {
                            VerifyCustomerPayloadModel customerInfo =
                                VerifyCustomerPayloadModel(
                              productId: ref.watch(selectedProductProvider)?.id,
                              vendorId: user?.id,
                              phone: _phoneNumberController.text,
                            );

                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            await customerVerificationNotifier
                                .verify(
                                  customerInfo: customerInfo,
                                )
                                .then(
                                  (value) =>
                                      phoneNumber = _phoneNumberController.text,
                                );
                          },
                          child: const Icon(
                            Icons.search,
                            size: 25,
                            color: AppColors.primary,
                          ),
                        ),
                  validator: InputFieldValidator.phoneNumber(),
                ),
              ),
              CustomerInformation(
                phoneNumber: phoneNumber,
              ),
              const SizedBox(height: 30),
              Consumer(
                builder: (context, ref, child) {
                  final initiatePayment = ref.watch(initiatePaymentProvider);
                  final initiatePaymentNotifier =
                      ref.read(initiatePaymentProvider.notifier);
                  final customerInfo = ref.watch(verifyCustomerProvider).value;
                  bool notChecked =
                      customerVerification is AsyncLoading<void> ||
                          customerInfo == null;

                  return SizedBox(
                    height: 50,
                    width: (customerInfo?.exists == false) ? 185 : 142,
                    child: Button(
                      background: notChecked ? AppColors.lightBlack20 : null,
                      width: 142,
                      borderRadius: 33,
                      label: (customerInfo?.exists ?? true)
                          ? AppLocalizations.of(context)!.nextStep
                          : 'Create Account',
                      isLoading: initiatePayment is AsyncLoading<void>,
                      onPressed: () async {
                        if (notChecked) {
                          return;
                        }

                        if (customerInfo.exists == true) {
                          InitiatePaymentPayloadModel paymentPayload =
                              InitiatePaymentPayloadModel(
                            productId: ref.watch(selectedProductProvider)?.id,
                            vendorId: user?.id,
                            salePrice: ref.watch(sellingPriceProvider),
                            clientName: user?.name,
                            clientPhone: user?.phone,
                          );

                          await initiatePaymentNotifier
                              .initiatePayment(
                            paymentPayload: paymentPayload,
                            paymentMethod: PaymentMethod.bkash,
                          )
                              .then((value) {
                            context.pushNamed(
                              Routes.webView,
                              queryParameters: {
                                'url': value?.bkashUrl,
                                'title': 'Bkash Payment',
                              },
                            );
                          });
                        }

                        if (customerInfo.exists == false) {
                          WidgetsBinding.instance.addPostFrameCallback(
                            (_) {
                              context.pushNamed(
                                Routes.customerSignUp,
                                queryParameters: {
                                  'webview': customerInfo.webview,
                                  'closing': customerInfo.closing,
                                },
                              );
                            },
                          );
                        }
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomerInformation extends ConsumerWidget {
  const CustomerInformation({
    super.key,
    this.phoneNumber,
  });
  final String? phoneNumber;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final customerInfo = ref.watch(verifyCustomerProvider).value;

    if (customerInfo == null) {
      return const Offstage();
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Row(
            children: [
              Container(
                height: 35,
                width: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.lighterBlue,
                  border: Border.all(
                    color: AppColors.white,
                    width: 2,
                  ),
                ),
                child: Icon(
                  customerInfo.exists ?? false
                      ? Icons.check_circle_outline_rounded
                      : Icons.cancel_outlined,
                  size: 20,
                  color: customerInfo.exists ?? false
                      ? AppColors.primary
                      : AppColors.red,
                ),
              ),
              const SizedBox(width: 15),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      customerInfo.name ?? 'N/A',
                      maxLines: 2,
                      style: AppTextStyle.bold16,
                    ),
                    Text(
                      '$phoneNumber',
                      style: AppTextStyle.medium12,
                    )
                  ],
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.status,
              style: AppTextStyle.medium12,
            ),
            Text(
              customerInfo.exists ?? false
                  ? AppLocalizations.of(context)!.verified
                  : AppLocalizations.of(context)!.notVerified,
              style: AppTextStyle.extraBold12.copyWith(
                color: customerInfo.exists ?? false
                    ? AppColors.primary
                    : AppColors.red,
              ),
            )
          ],
        )
      ],
    );
  }
}
