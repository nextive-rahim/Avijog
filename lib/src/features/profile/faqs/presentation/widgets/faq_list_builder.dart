part of '../../../root/presentation/pages/profile_page.dart';

class _FaqListBuilder extends StatelessWidget {
  const _FaqListBuilder({
    super.key,
    required this.faqs,
  });
  final List<FaqEntity> faqs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: faqs.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: ((context, index) {
        return ProviderScope(
          overrides: [
            faqDataProvider.overrideWithValue(
              faqs[index],
            ),
          ],
          child: const _FaqCard(),
        );
      }),
    );
  }
}
