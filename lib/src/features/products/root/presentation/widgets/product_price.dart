import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';

class PriceSection extends StatelessWidget {
  const PriceSection({
    super.key,
    this.isProductDetails = false,
    required this.basePrice,
    this.discountedPrice,
  });
  final bool isProductDetails;
  final int basePrice;
  final int? discountedPrice;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        isProductDetails
            ? const Offstage()
            : Text(
                AppLocalizations.of(context)!.price,
                style: AppTextStyle.bold16.copyWith(fontSize: 16.sp),
              ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (discountedPrice != null)
              Row(
                children: [
                  Stack(
                    children: [
                      Text(
                        '$basePrice',
                        style: AppTextStyle.extraBold11.copyWith(
                          color: AppColors.lightBlack80,
                          fontSize: 11.sp,
                        ),
                      ),
                      Image.asset(
                        Assets.cutLine.path,
                        height: 11.w,
                      )
                    ],
                  ),
                  Image.asset(
                    Assets.tkSymboleLight.path,
                    height: 7,
                    width: 7,
                  )
                ],
              ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$discountedPrice',
                  style: AppTextStyle.bold16.copyWith(
                    color: AppColors.black,
                    fontSize: 15.sp,
                  ),
                ),
                Image.asset(
                  Assets.tkSymbol.path,
                  height: 11,
                  width: 12,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}
