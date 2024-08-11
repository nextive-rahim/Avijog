import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/features/dashboard/presentation/riverpod/dashboard_provider.dart';

class DashboardPage extends ConsumerStatefulWidget {
  const DashboardPage({
    super.key,
    required this.navigationShell,
  });
  final StatefulNavigationShell navigationShell;
  @override
  // ignore: library_private_types_in_public_api
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends ConsumerState<DashboardPage> {
  void _goBranch(int index) {
    widget.navigationShell.goBranch(
      index,
      initialLocation: index == widget.navigationShell.currentIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    final indexProvider = ref.watch(bottomNavigationIndexProvider);

    return Scaffold(
      extendBody: true,
      body: widget.navigationShell,
      bottomNavigationBar: BottomAppBar(
        elevation: 10,
        shadowColor: AppColors.black,
        padding: EdgeInsets.zero,
        color: AppColors.red,
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        surfaceTintColor: Colors.red,
        clipBehavior: Clip.antiAlias,
        child: Container(
          decoration: const BoxDecoration(),
          child: BottomNavigationBar(
            currentIndex: indexProvider,
            backgroundColor: AppColors.white,
            selectedItemColor: AppColors.primary,
            onTap: (index) {
              ref
                  .read(bottomNavigationIndexProvider.notifier)
                  .update((state) => index);
              _goBranch(index);
            },
            items: [
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.fileText.path,
                  height: 24,
                  width: 24,
                  color: indexProvider == 0
                      ? AppColors.primary
                      : AppColors.lightBlack20,
                ),
                label: AppLocalizations.of(context)!.history,
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '',
              ),
              BottomNavigationBarItem(
                icon: Image.asset(
                  Assets.user.path,
                  height: 24,
                  width: 24,
                  color: indexProvider == 2
                      ? AppColors.primary
                      : AppColors.lightBlack20,
                ),
                label: AppLocalizations.of(context)!.profile,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () {
            ref
                .read(bottomNavigationIndexProvider.notifier)
                .update((state) => 1);
            _goBranch(1);
          },
          child: Image.asset(
            Assets.floatBtn.path,
            height: 65,
            width: 65,
          ),
        ),
      ),
    );
  }
}
