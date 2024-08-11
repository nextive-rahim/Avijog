import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/presentation/widgets/product_price.dart';

class ProductCard extends ConsumerWidget {
  const ProductCard({
    super.key,
    required this.product,
  });
  final ProductEntity product;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.productDetails,
          queryParameters: {
            'productId': product.id,
            'productName': product.name,
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.only(
          left: 10,
          right: 10,
          bottom: 10,
          top: 10,
        ),
        decoration: BoxDecoration(
          color: AppColors.lighterBlue,
          borderRadius: BorderRadius.circular(15),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
              ),
              child: SizedBox(
                height: 90.w,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: AppCachedNetworkImage(image: product.image),
                ),
              ),
            ),
            SizedBox(height: 8.w),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    product.name ?? '',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    style: AppTextStyle.bold14.copyWith(
                      fontSize: 14.sp,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(height: 3.w),
                  if (product.shortDescription?.isNotEmpty ?? false)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        product.shortDescription ?? '',
                        style: AppTextStyle.medium12.copyWith(
                          height: 1.2,
                          fontSize: 12.sp,
                        ),
                        maxLines: 2,
                        textAlign: TextAlign.center,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                ],
              ),
            ),
            SizedBox(height: 5.w),
            PriceSection(
              basePrice: product.basePrice ?? 0,
              discountedPrice: product.discountedPrice,
            ),
          ],
        ),
      ),
    );
  }
}
