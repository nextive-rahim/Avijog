part of '../pages/profile_page.dart';

class ProfileHeaderSection extends ConsumerWidget {
  const ProfileHeaderSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUser = ref.watch(userProvider);

    return Container(
      height: 100,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.dashboardLogo.path,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Consumer(
                  builder: (context, ref, child) {
                    return asyncUser.when(
                      data: (user) {
                        return Row(
                          children: [
                            Container(
                              height: 56,
                              width: 56,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50)),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: const AppCachedNetworkImage(
                                  image: ConstantData.noFoundImage,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          user?.name ?? 'Unknown',
                                          maxLines: 3,
                                          style: AppTextStyle.bold20.copyWith(
                                            color: AppColors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    user?.phone ?? '',
                                    style: AppTextStyle.regular14
                                        .copyWith(color: AppColors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                      loading: () => _buildUserLoadingWidget(),
                      error: (error, stack) => const Offstage(),
                    );
                  },
                ),
              ),
              InkWell(
                onTap: () {
                  context.pushNamed(Routes.profileUpdated);
                },
                child: Image.asset(
                  Assets.edit.path,
                  height: 20,
                  width: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildUserLoadingWidget() {
    return Row(
      children: [
        Container(
          height: 56,
          width: 56,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: AppColors.lighterBlue,
          ),
        ),
        const SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 18,
              width: 120,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.lighterBlue,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              height: 18,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: AppColors.lighterBlue,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
