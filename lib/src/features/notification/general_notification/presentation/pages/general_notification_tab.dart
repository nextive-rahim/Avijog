part of '../../../root/presentation/page/notification_page.dart';

class GeneralNotificationTab extends ConsumerWidget {
  const GeneralNotificationTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asynOfferNotifierProvider =
        ref.watch(notificationProvider(NotificaionType.general.name));
    return RefreshIndicator(
      onRefresh: () async {
        return ref.refresh(notificationProvider(NotificaionType.general.name));
      },
      child: switch (asynOfferNotifierProvider) {
        AsyncError(:final error) => Text('Error: $error'),
        AsyncData(:final value) =>
          GeneralNotificationListBuilder(generalNotificatons: value),
        _ => const ListViewLoading(),
      },
    );
  }
}
