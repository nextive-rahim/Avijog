part of '../pages/product_details_page.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _CalculateCommission extends ConsumerStatefulWidget {
  const _CalculateCommission({
    super.key,
    required this.product,
  });
  final ProductEntity? product;

  @override
  ConsumerState<_CalculateCommission> createState() =>
      _CalculateCommissionState();
}

class _CalculateCommissionState extends ConsumerState<_CalculateCommission> {
  final sellingPriceController = TextEditingController();
  int basePrice = 0;
  int minimumSellingPrice = 0;
  int maximumSellingPrice = 0;
  int commissionInPercent = 0;
  int commissionAmount = 0;
  int yourCommission = 0;
  int youNeedToPay = 0;

  bool get maximumPriceCrossed {
    if (sellingPriceController.text.isEmpty) {
      return false;
    }
    return double.parse(sellingPriceController.text) > maximumSellingPrice;
  }

  bool get minimumPriceCrossed {
    if (sellingPriceController.text.isEmpty) {
      return false;
    }
    return double.parse(sellingPriceController.text) < minimumSellingPrice;
  }

  bool get isSellingPriceInvalid =>
      sellingPriceController.text.isEmpty ||
      minimumPriceCrossed ||
      maximumPriceCrossed;

  @override
  Widget build(BuildContext context) {
    basePrice = widget.product?.basePrice ?? 0;
    minimumSellingPrice = widget.product?.minimumSellingPrice ?? 0;
    maximumSellingPrice = widget.product?.basePrice ?? 0;
    commissionInPercent = widget.product?.comission ?? 0;
    yourCommission = isSellingPriceInvalid
        ? 0
        : (double.parse(sellingPriceController.text) * commissionInPercent) ~/
            100;
    youNeedToPay = isSellingPriceInvalid
        ? 0
        : (double.parse(sellingPriceController.text) - yourCommission)
            .toInt()
            .floor();

    return Padding(
      padding: const EdgeInsets.only(top: 58),
      child: Column(
        children: [
          Container(
            color: AppColors.lighterBlue,
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 15,
            ),
            child: Column(
              children: [
                _PriceInfoItem(
                  title: AppLocalizations.of(context)!.minimumSellingPrice,
                  value: '$minimumSellingPrice',
                ),
                const SizedBox(height: 10),
                _PriceInfoItem(
                  title: AppLocalizations.of(context)!.commission,
                  value: '$commissionInPercent %',
                  showSymbol: false,
                ),
                const SizedBox(height: 10),
                _PriceInfoItem(
                  title: AppLocalizations.of(context)!.yourSellingPrice,
                  showSymbol: false,
                  valueWidget: Form(
                    key: _formKey,
                    child: Expanded(
                      flex: 2,
                      child: SizedBox(
                        height: 42,
                        child: TextFormField(
                          textInputAction: TextInputAction.done,
                          autofocus: false,
                          controller: sellingPriceController,
                          decoration: InputDecoration(
                            hintText: '',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 12,
                            ),
                            fillColor: AppColors.white,
                          ),
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.allow(
                              RegExp(r'^\d+\.?\d{0,2}'),
                            ),
                          ],
                          validator: (value) {
                            if (maximumPriceCrossed) {
                              return 'You can\'t sell more than $basePrice';
                            }
                            if (minimumPriceCrossed) {
                              return 'You can\'t sell less than $minimumSellingPrice';
                            }
                            return null;
                          },
                          onFieldSubmitted: (value) {
                            if (!_formKey.currentState!.validate()) {
                              return;
                            }

                            if (sellingPriceController.text.isEmpty) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Please Enter Selling Price'),
                                  dismissDirection: DismissDirection.up,
                                ),
                              );
                              return;
                            }

                            ref.read(sellingPriceProvider.notifier).state =
                                double.parse(sellingPriceController.text);

                            _userVerificationBottomSheet(context);
                          },
                          onEditingComplete: () {
                            if (minimumPriceCrossed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You can\'t sell less than $minimumSellingPrice',
                                  ),
                                  dismissDirection: DismissDirection.down,
                                ),
                              );
                              return;
                            }

                            if (maximumPriceCrossed) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    'You can\'t sell more than $basePrice',
                                  ),
                                  dismissDirection: DismissDirection.down,
                                ),
                              );
                              return;
                            }
                          },
                          onChanged: (value) {
                            _formKey.currentState?.validate();
                            setState(() {});
                          },
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                _PriceInfoItem(
                  title: AppLocalizations.of(context)!.yourCommission,
                  value: '$yourCommission',
                ),
                const SizedBox(height: 10),
                _PriceInfoItem(
                  title: AppLocalizations.of(context)!.youNeedToPay,
                  value: '$youNeedToPay',
                ),
              ],
            ),
          ),
          const SizedBox(height: 55),
          Container(
            width: 142,
            height: 46,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: Button(
              background: isSellingPriceInvalid ? AppColors.lightBlack40 : null,
              borderRadius: 50,
              label: AppLocalizations.of(context)!.nextStep,
              onPressed: () {
                if (minimumPriceCrossed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Enter Mininum Selling Price'),
                      dismissDirection: DismissDirection.up,
                    ),
                  );
                  return;
                }
                if (maximumPriceCrossed) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('You Cross Maxinum Selling Price'),
                      dismissDirection: DismissDirection.up,
                    ),
                  );
                  return;
                }
                if (sellingPriceController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please Enter Selling Price'),
                      dismissDirection: DismissDirection.up,
                    ),
                  );
                  return;
                }

                ref.read(sellingPriceProvider.notifier).state =
                    double.parse(sellingPriceController.text);
                _userVerificationBottomSheet(context);
              },
            ),
          )
        ],
      ),
    );
  }
}

class _PriceInfoItem extends StatelessWidget {
  const _PriceInfoItem({
    super.key,
    required this.title,
    this.value,
    this.showSymbol = true,
    this.valueWidget,
  });
  final String title;
  final String? value;
  final bool showSymbol;
  final Widget? valueWidget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 4,
          child: Text(
            title,
            style: AppTextStyle.extraBold16,
          ),
        ),
        Builder(
          builder: (context) {
            if (valueWidget != null) {
              return valueWidget!;
            }

            if (value == null) {
              return const Offstage();
            }

            return Row(
              children: [
                Text(
                  value ?? '',
                  style: AppTextStyle.extraBold20,
                ),
                if (showSymbol)
                  Padding(
                    padding: const EdgeInsets.only(left: 3),
                    child: Image.asset(
                      Assets.tkSymbol.path,
                      height: 17,
                      width: 14,
                    ),
                  )
              ],
            );
          },
        ),
      ],
    );
  }
}
