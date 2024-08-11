import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/service/cache/cache_keys.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';

class SplashPage extends ConsumerStatefulWidget {
  const SplashPage({super.key});

  @override
  ConsumerState<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends ConsumerState<SplashPage> {
  @override
  void initState() {
    super.initState();

    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    await ref.read(cacheServiceProvider).init();
    final cacheService = ref.watch(cacheServiceProvider);
    bool? seenWelcomeScreen = await Future.microtask(
      () => cacheService.read(CacheKeys.seenWelcomeScreen).then(
            (value) => value,
          ),
    );
    String? token = await Future.microtask(
      () => cacheService.read(CacheKeys.token).then(
            (value) => value,
          ),
    );

    Future.delayed(const Duration(seconds: 2)).then(
      (value) {
        if (seenWelcomeScreen != true) {
          context.goNamed(Routes.welcome);
          return;
        }

        if (token == null) {
          context.goNamed(Routes.homeTab);
          return;
        }
        context.goNamed(Routes.homeTab);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.pageBackgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                padding: const EdgeInsets.all(15),
                child: _buildLogo(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const FlutterLogo(size: 100);
  }
}
