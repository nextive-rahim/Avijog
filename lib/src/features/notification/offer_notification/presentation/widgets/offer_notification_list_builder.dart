part of '../../../root/presentation/page/notification_page.dart';

class OfferNotificationListBuilder extends StatelessWidget {
  const OfferNotificationListBuilder(
      {super.key, required this.offerNotifications});
  final List<NotificationEntity> offerNotifications;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: offerNotifications.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        NotificationEntity offers = offerNotifications[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: OfferNotificationCard(offers: offers),
        );
      },
    );
  }
}
