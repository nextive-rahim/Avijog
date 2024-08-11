part of '../../../root/presentation/pages/profile_page.dart';

class FaqPage extends StatelessWidget {
  const FaqPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.faqs,
          style: const TextStyle(color: AppColors.white),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Consumer(
            builder: (context, ref, child) {
              final asyncFaq = ref.watch(faqProvider);

              return asyncFaq.when(
                data: (faqs) {
                  return _FaqListBuilder(faqs: faqs!);
                },
                loading: () => const _LoadingWidget(height: 50),
                error: (error, stackTrace) {
                  return const Offstage();
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
