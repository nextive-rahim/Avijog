part of '../../../root/presentation/pages/profile_page.dart';

class PrivacyPolicyPage extends StatelessWidget {
  const PrivacyPolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.privacyPolicy,
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
        padding: const EdgeInsets.all(20),
        child: Consumer(
          builder: (context, ref, child) {
            final asyncPrivacyPolicy = ref.watch(privacyPolicyProvider);

            return asyncPrivacyPolicy.when(
              data: (privacyPolicy) {
                return Text(
                  privacyPolicy?.content ?? '',
                );
              },
              loading: () => const _LoadingWidget(),
              error: (error, stackTrace) {
                return const Offstage();
              },
            );
          },
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget({this.height = 30});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 50,
      separatorBuilder: (BuildContext context, int index) {
        return const SizedBox(height: 10);
      },
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: height,
          decoration: BoxDecoration(
            color: AppColors.lighterBlue,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
