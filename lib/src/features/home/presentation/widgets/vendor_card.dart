import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';

class VendorCard extends ConsumerWidget {
  const VendorCard({
    super.key,
    required this.vendor,
  });
  final VendorEntity vendor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () {
        context.pushNamed(
          Routes.products,
          queryParameters: {
            'vendorId': vendor.id,
            'vendorName': vendor.instituteName,
          },
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lighterBlue,
          borderRadius: BorderRadius.circular(10),
        ),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 47,
              width: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.primary,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: AppCachedNetworkImage(
                  image: vendor.logo,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10).copyWith(
                top: 2,
              ),
              child: Text(
                vendor.name ?? 'N/A',
                style: AppTextStyle.bold14.copyWith(
                  color: AppColors.lightBlack90,
                ),
                maxLines: 2,
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
