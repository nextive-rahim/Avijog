import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/service/cache/cache_keys.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  height: 233,
                  width: 252,
                  child: Image.asset(
                    Assets.onBoarding.path,
                    cacheHeight: 611,
                    cacheWidth: 661,
                  ),
                ),
              ),
              const SizedBox(height: 64),
              Text(
                AppLocalizations.of(context)!.appName,
                style: AppTextStyle.bold32,
              ),
              const SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.onBoardingSubTitle,
                textAlign: TextAlign.center,
                style: AppTextStyle.medium14,
              ),
              const SizedBox(height: 75),
              Consumer(
                builder: (context, ref, child) {
                  return InkWell(
                    onTap: () {
                      ref.read(cacheServiceProvider).save(
                            CacheKeys.seenWelcomeScreen,
                            true,
                          );

                      context.goNamed(Routes.login);
                    },
                    child: Image.asset(
                      Assets.onBoardingStartupIcon.path,
                      height: 100,
                      width: 100,
                      cacheHeight: 262,
                      cacheWidth: 262,
                    ),
                  );
                },
              ),
              const SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.letsGo,
                style: AppTextStyle.bold18,
              )
            ],
          ),
        ),
      ),
    );
  }
}
