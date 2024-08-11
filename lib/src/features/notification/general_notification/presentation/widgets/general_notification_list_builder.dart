part of '../../../root/presentation/page/notification_page.dart';

class GeneralNotificationListBuilder extends StatelessWidget {
  const GeneralNotificationListBuilder(
      {super.key, required this.generalNotificatons});
  final List<NotificationEntity> generalNotificatons;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: generalNotificatons.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final NotificationEntity notification = generalNotificatons[index];
        return Padding(
          padding: const EdgeInsets.only(top: 20),
          child: GeneralNotificationCard(generalNofifications: notification),
        );
      },
    );
  }
}
