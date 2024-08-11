part of '../../../root/presentation/pages/profile_page.dart';

class _FaqCard extends ConsumerStatefulWidget {
  const _FaqCard({super.key});

  @override
  ConsumerState<_FaqCard> createState() => _FaqCardState();
}

class _FaqCardState extends ConsumerState<_FaqCard> {
  final ValueNotifier<bool> _isExpanded = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    FaqEntity faq = ref.read(faqDataProvider);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColors.primary,
        border: Border.all(color: AppColors.lightBlack20),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          onExpansionChanged: (bool value) {
            _isExpanded.value = !_isExpanded.value;
          },
          title: Text(
            faq.question ?? '',
            style: AppTextStyle.bold16.copyWith(
              color: AppColors.white,
            ),
          ),
          trailing: ValueListenableBuilder(
            valueListenable: _isExpanded,
            builder: (BuildContext context, bool value, Widget? child) {
              return value
                  ? Image.asset(
                      Assets.upArrow.path,
                      width: 16,
                      height: 16,
                    )
                  : Image.asset(
                      Assets.downArrow.path,
                      width: 24,
                      height: 24,
                    );
            },
          ),
          children: <Widget>[
            Container(
              margin: const EdgeInsets.only(
                left: 10,
                right: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: AppColors.lighterBlue,
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  faq.answer ?? '',
                  style: AppTextStyle.medium14,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
