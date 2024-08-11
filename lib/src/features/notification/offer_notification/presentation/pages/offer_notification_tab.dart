part of '../../../root/presentation/page/notification_page.dart';

class OfferNotificationTab extends ConsumerWidget {
  const OfferNotificationTab({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asynOfferNotifierProvider =
        ref.watch(notificationProvider(NotificaionType.offer.name));
    return RefreshIndicator(
      onRefresh: () async {
        return ref.refresh(notificationProvider(NotificaionType.offer.name));
      },
      child: switch (asynOfferNotifierProvider) {
        AsyncError(:final error) => Text('Error: $error'),
        AsyncData(:final value) =>
          OfferNotificationListBuilder(offerNotifications: value),
        _ => const ListViewLoading(height: 170),
      },
    );
  }
}
