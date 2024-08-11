part of '../pages/home_page.dart';

class BkashBalanceAnimation extends ConsumerStatefulWidget {
  const BkashBalanceAnimation({super.key});

  @override
  ConsumerState<BkashBalanceAnimation> createState() =>
      _BkashBalanceAnimationState();
}

class _BkashBalanceAnimationState extends ConsumerState<BkashBalanceAnimation> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _OverviewItem(
          count: '২০',
          title: 'সর্বমোট',
          color: Colors.purple,
        ),
        _OverviewItem(
          count: '১৮',
          title: 'চলমান',
          color: Colors.lime,
        ),
        _OverviewItem(
          count: '০৫',
          title: 'সমাধান হয়েছে',
          color: Colors.yellow,
        )
      ],
    );
  }
}

class _OverviewItem extends StatelessWidget {
  const _OverviewItem({
    super.key,
    required this.count,
    required this.title,
    required this.color,
  });
  final String title;
  final String count;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: AppTextStyle.bold16.copyWith(color: AppColors.white),
        ),
        Text(
          count.toString(),
          style: AppTextStyle.bold20.copyWith(color: color),
        )
      ],
    );
  }
}
