import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/extension/url_launcher.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/features/home/domain/entities/banner_entity.dart';
import 'package:obhijuk/src/features/home/domain/entities/vendor_entity.dart';
import 'package:obhijuk/src/features/home/presentation/riverpod/all_vendors_provider.dart';
import 'package:obhijuk/src/features/home/presentation/riverpod/balance_provider.dart';
import 'package:obhijuk/src/features/home/presentation/riverpod/banners_provider.dart';
import 'package:obhijuk/src/features/home/presentation/widgets/vendor_card.dart';

part '../widgets/all_vendors.dart';
part '../widgets/bkash_balance_animation.dart';
part '../widgets/home_banner.dart';
part '../widgets/home_header_section.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.appName,
          style: AppTextStyle.extraBold24.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 30),
            child: InkWell(
              onTap: () {
                context.pushNamed(Routes.notification);
              },
              child: Image.asset(
                Assets.notifications.path,
                height: 30,
                width: 30,
              ),
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(balanceProvider);
          ref.invalidate(allVendorsProvider);
          ref.invalidate(bannersProvider);
        },
        child: const SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            children: [
              HomeHeaderSection(),
              AllVendors(),
              BannerWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
