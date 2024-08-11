part of '../pages/product_details_page.dart';

class _ProductDetailsHeader extends StatelessWidget {
  const _ProductDetailsHeader({
    super.key,
    required this.product,
  });
  final ProductEntity? product;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 170,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4),
              child: AppCachedNetworkImage(
                image: product?.image,
              ),
            ),
          ),
          const SizedBox(height: 21),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (product?.category?.isNotEmpty ?? false)
                      Text(
                        product?.category ?? '',
                        style: AppTextStyle.medium12,
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            product?.name ?? '',
                            style: AppTextStyle.extraBold24.copyWith(
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              PriceSection(
                isProductDetails: true,
                basePrice: product?.basePrice ?? 0,
                discountedPrice: product?.discountedPrice,
              )
            ],
          )
        ],
      ),
    );
  }
}
