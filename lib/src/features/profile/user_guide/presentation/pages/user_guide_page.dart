part of '../../../root/presentation/pages/profile_page.dart';

class UserGuidePage extends StatelessWidget {
  const UserGuidePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.userGuide,
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
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Consumer(
            builder: (context, ref, child) {
              final asyncUserGuide = ref.watch(userGuideProvider);

              return asyncUserGuide.when(
                data: (userGuide) {
                  return Text(userGuide!.content ?? '');
                },
                loading: () => const _LoadingWidget(),
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
