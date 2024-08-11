part of '../pages/profile_page.dart';

class ProfileBodySection extends StatelessWidget {
  const ProfileBodySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Container(
          color: AppColors.lighterBlue,
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 28,
          ),
          child: Column(
            children: [
              ProfileListTile(
                image: Assets.language.path,
                title: AppLocalizations.of(context)!.language,
                isLanguage: true,
              ),
              ProfileListTile(
                image: Assets.accountType.path,
                title: AppLocalizations.of(context)!.account_type,
                isAccountType: true,
              ),
              InkWell(
                onTap: () {
                  urlLauncher(
                    link: 'https://wa.me/+8801515287150',
                  );
                },
                child: Container(
                  width: 188,
                  height: 36,
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        Assets.whatsapp.path,
                        height: 20,
                        width: 20,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        AppLocalizations.of(context)!.supportCenter,
                        style: AppTextStyle.bold16,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                ConstantData.dashLine,
                maxLines: 1,
              ),
              const SizedBox(height: 12),
              ProfileListTile(
                onTap: () {
                  context.pushNamed(Routes.passwordChange);
                },
                image: Assets.pinChange.path,
                title: AppLocalizations.of(context)!.pinCahnge,
              ),
              ProfileListTile(
                onTap: () {
                  context.pushNamed(Routes.userGuide);
                },
                image: Assets.userGuide.path,
                title: AppLocalizations.of(context)!.userGuide,
              ),
              ProfileListTile(
                onTap: () {
                  context.pushNamed(Routes.privacyPolicy);
                },
                image: Assets.privacyPolicy.path,
                title: AppLocalizations.of(context)!.privacyPolicy,
              ),
              ProfileListTile(
                onTap: () {
                  context.pushNamed(Routes.faq);
                },
                image: Assets.faq.path,
                title: AppLocalizations.of(context)!.faqs,
                isLast: true,
              ),
              const SizedBox(height: 10),
              const LogOutSection(),
              const _DeveloperSection(),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

class LogOutSection extends ConsumerWidget {
  const LogOutSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        appDialog(
            context: context,
            title: AppLocalizations.of(context)!.logOut,
            description: 'Are you sure you want to log out?',
            onYesPressed: () {
              ref.read(cacheServiceProvider).delete(CacheKeys.token);
              context.goNamed(Routes.login);
            });
      },
      child: Container(
        height: 45,
        width: 142,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(50),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              Assets.logOut.path,
              height: 20,
              width: 20,
            ),
            const SizedBox(width: 5),
            Text(
              AppLocalizations.of(context)!.logOut,
              style: AppTextStyle.extraBold16.copyWith(color: AppColors.white),
            )
          ],
        ),
      ),
    );
  }
}

class _DeveloperSection extends ConsumerStatefulWidget {
  const _DeveloperSection({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _DeveloperSectionState();
}

class _DeveloperSectionState extends ConsumerState<_DeveloperSection> {
  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  final ValueNotifier<PackageInfo> _packageInfo = ValueNotifier<PackageInfo>(
    PackageInfo(
      appName: 'Unknown',
      packageName: 'Unknown',
      version: 'Unknown',
      buildNumber: 'Unknown',
    ),
  );

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();

    _packageInfo.value = info;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.pushNamed(
        Routes.webView,
        queryParameters: {
          'url': 'https://nextivesolution.com',
          'title': 'Nextive Solution',
        },
      ),
      child: Column(
        children: [
          10.sh,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Developed by  ',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
              Text(
                ' Nextive Solution',
                style: AppTextStyle.bold14.copyWith(color: AppColors.primary),
              ),
            ],
          ),
          ValueListenableBuilder<PackageInfo>(
            valueListenable: _packageInfo,
            builder: (BuildContext context, PackageInfo value, child) {
              return Text("${value.version} (${value.buildNumber})");
            },
          ),
        ],
      ),
    );
  }
}

class ProfileListTile extends ConsumerWidget {
  const ProfileListTile({
    super.key,
    required this.image,
    required this.title,
    this.isLast = false,
    this.isLanguage = false,
    this.isAccountType = false,
    this.onTap,
  });
  final String image;
  final String title;
  final bool? isLast;
  final bool? isLanguage;
  final bool? isAccountType;
  final Function()? onTap;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image.asset(
                    image,
                    height: 42,
                    width: 42,
                  ),
                  const SizedBox(width: 18),
                  Text(
                    title,
                    style: AppTextStyle.bold16,
                  ),
                ],
              ),
              Row(
                children: [
                  isLanguage == true
                      ? InkWell(
                          onTap: () {
                            if (ref.read(languageProvider.notifier).state ==
                                Language.bangla) {
                              ref
                                  .read(languageRepositoryProvider)
                                  .setLanguage(Language.english);
                            } else if (ref
                                    .read(languageProvider.notifier)
                                    .state ==
                                Language.english) {
                              ref
                                  .read(languageRepositoryProvider)
                                  .setLanguage(Language.bangla);
                            }
                          },
                          child: Row(
                            children: [
                              Text(ref
                                  .read(languageProvider.notifier)
                                  .state
                                  .flag),
                              const SizedBox(width: 7),
                              Text(
                                AppLocalizations.of(context)!.language_type,
                                style: AppTextStyle.medium16,
                              ),
                            ],
                          ),
                        )
                      : const Offstage(),
                  const SizedBox(width: 3),
                  isAccountType == true
                      ? Text(
                          AppLocalizations.of(context)!.general,
                          style: AppTextStyle.medium16,
                        )
                      : const Icon(
                          Icons.arrow_forward_ios,
                          size: 18,
                          color: AppColors.black,
                        ),
                ],
              )
            ],
          ),
          const SizedBox(height: 12),
          isLast == false
              ? const Text(
                  '---------------------------------------------------------------',
                  maxLines: 1,
                )
              : const Offstage(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
