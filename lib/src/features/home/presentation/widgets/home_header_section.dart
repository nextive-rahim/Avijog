part of '../pages/home_page.dart';

class HomeHeaderSection extends StatelessWidget {
  const HomeHeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            Assets.dashboardLogo.path,
          ),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'সমাধান ওভারভিউ',
            style: AppTextStyle.extraBold20.copyWith(
              color: AppColors.white,
            ),
          ),
          10.sh,
          const BkashBalanceAnimation(),
          13.sh,
        ],
      ),
    );
  }
}
