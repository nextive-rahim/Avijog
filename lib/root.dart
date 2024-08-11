import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';
import 'package:obhijuk/src/core/theme/theme.dart';
import 'package:obhijuk/src/core/widgets/web_view_page.dart';
import 'package:obhijuk/src/features/authentication/forget_password/presentation/pages/forget_password_page.dart';
import 'package:obhijuk/src/features/authentication/login/presentation/pages/login_page.dart';
import 'package:obhijuk/src/features/authentication/login/presentation/pages/verify_user_page.dart';
import 'package:obhijuk/src/features/authentication/otp/presentation/pages/otp_page.dart';
import 'package:obhijuk/src/features/authentication/signup/presentation/pages/signup_page.dart';
import 'package:obhijuk/src/features/dashboard/view/dashboard_page.dart';
import 'package:obhijuk/src/features/home/presentation/pages/home_page.dart';
import 'package:obhijuk/src/features/language/pages/riverpod/language_provider.dart';

import 'package:obhijuk/src/features/notification/root/presentation/page/notification_page.dart';
import 'package:obhijuk/src/features/payment_history/presentation/pages/payment_history_page.dart';

import 'package:obhijuk/src/features/products/product_details/presentation/pages/customer_sign_up_webview_page.dart';

import 'package:obhijuk/src/features/products/product_details/presentation/pages/product_details_page.dart';
import 'package:obhijuk/src/features/products/root/presentation/pages/products_page.dart';
import 'package:obhijuk/src/features/profile/root/presentation/pages/profile_page.dart';
import 'package:obhijuk/src/onboarding/splash_screen.dart';
import 'package:obhijuk/src/onboarding/welcome_page.dart';

part 'src/core/routes/app_pages.dart';

class Root extends ConsumerStatefulWidget {
  const Root({super.key});

  @override
  ConsumerState<Root> createState() => _RootState();
}

class _RootState extends ConsumerState<Root> {
  @override
  void initState() {
    super.initState();
    initialize();
  }

  void initialize() async {
    await ref.read(cacheServiceProvider).init();
  }

  @override
  Widget build(BuildContext context) {
    final language = ref.watch(languageProvider);
    return ScreenUtilInit(
        useInheritedMediaQuery: true,
        designSize: const Size(375, 812),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, _) {
          //   debugInvertOversizedImages = true;
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'Nextive Affiliators',
            theme: themeData,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            routerConfig: _router,
            builder: (_, router) {
              return MediaQuery(
                data: MediaQuery.of(_).copyWith(
                  textScaler: const TextScaler.linear(1.0),
                ),
                child: router!,
              );
            },
            locale: Locale(language.code),
          );
        });
  }
}
