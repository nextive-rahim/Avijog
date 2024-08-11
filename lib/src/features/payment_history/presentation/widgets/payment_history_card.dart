part of '../pages/payment_history_page.dart';

class _PaymentHistoryCard extends StatelessWidget {
  const _PaymentHistoryCard({
    super.key,
    required this.paymentHistoryModel,
  });
  final HistoryEntity? paymentHistoryModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lighterBlue,
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            _PaymentHistoryCardHeader(
                paymentHistoryModel: paymentHistoryModel!),
            const Text(
              ConstantData.dashLine,
              maxLines: 1,
            ),
            5.sh,
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 105,
                  width: 105,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(6),
                    child: AppCachedNetworkImage(
                      image: paymentHistoryModel?.product?.image,
                      errorWidget: Image.network(ConstantData.noFoundImage),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Flexible(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _PaymentHistoryItems(
                        title: AppLocalizations.of(context)!.vendor,
                        value: paymentHistoryModel?.vendor?.name ?? 'N/A',
                      ),
                      _PaymentHistoryItems(
                        title: AppLocalizations.of(context)!.product,
                        value: paymentHistoryModel?.product?.name ?? 'N/A',
                      ),
                      _PaymentHistoryItems(
                        title: AppLocalizations.of(context)!.student,
                        value: paymentHistoryModel?.clientName ?? 'N/A',
                      ),
                      _PaymentHistoryItems(
                          title: AppLocalizations.of(context)!.phone,
                          value: paymentHistoryModel?.clientPhone ?? 'N/A'),
                      _PaymentHistoryItems(
                        title: AppLocalizations.of(context)!.status,
                        value: paymentHistoryModel?.status ?? '',
                      ),
                      _PriceSection(paymentHistoryModel: paymentHistoryModel!)
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _PriceSection extends ConsumerWidget {
  const _PriceSection({super.key, required this.paymentHistoryModel});
  final HistoryEntity paymentHistoryModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              Row(
                children: [
                  Text(
                    paymentHistoryModel.amount.toString(),
                    style: AppTextStyle.extraBold20,
                  ),
                  Image.asset(
                    Assets.tkSymbol.path,
                    height: 14,
                    width: 12,
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.price,
                style: AppTextStyle.medium10,
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Text(
                    paymentHistoryModel.comission.toString(),
                    style: AppTextStyle.extraBold20,
                  ),
                  Image.asset(
                    Assets.tkSymbol.path,
                    height: 14,
                    width: 12,
                  ),
                ],
              ),
              Text(
                AppLocalizations.of(context)!.commission,
                style: AppTextStyle.medium10,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PaymentHistoryCardHeader extends ConsumerWidget {
  const _PaymentHistoryCardHeader(
      {super.key, required this.paymentHistoryModel});
  final HistoryEntity paymentHistoryModel;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text(
              AppLocalizations.of(context)!.orderId,
              style: AppTextStyle.medium12,
            ),
            const SizedBox(height: 4),
            Text(
              paymentHistoryModel.orderId!,
              style: AppTextStyle.extraBold12,
            )
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "${AppLocalizations.of(context)!.date} ${paymentHistoryModel.createdAt!.formattedDate()}",
              style: AppTextStyle.medium12,
            ),
            const SizedBox(height: 4),
            Text(
              "${AppLocalizations.of(context)!.time} ${paymentHistoryModel.createdAt!.formattedTime()}",
              style: AppTextStyle.medium12,
            ),
          ],
        ),
      ],
    );
  }
}

class _PaymentHistoryItems extends ConsumerWidget {
  const _PaymentHistoryItems({
    super.key,
    required this.title,
    required this.value,
  });
  final String title;
  final String value;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Row(
        children: [
          Text(
            title,
            style: AppTextStyle.medium12,
          ),
          Flexible(
            child: Text(
              value,
              style: AppTextStyle.extraBold12,
            ),
          ),
        ],
      ),
    );
  }
}
