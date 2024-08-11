part of '../pages/product_details_page.dart';

class _ProductDescription extends StatelessWidget {
  const _ProductDescription({super.key, this.product});
  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.subscriptionFacility,
            style: AppTextStyle.bold16,
          ),
          const SizedBox(height: 10),
          ReadMoreText(
            product?.description ?? '',
            trimLines: 4,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: '..Show less',
            moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
            lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),
        ],
      ),
    );
  }
}
