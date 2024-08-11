part of '../../../root/presentation/page/notification_page.dart';

class GeneralNotificationCard extends StatelessWidget {
  const GeneralNotificationCard(
      {super.key, required this.generalNofifications});
  final NotificationEntity generalNofifications;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lighterBlue,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Row(
                children: [
                  Container(
                    height: 45,
                    width: 45,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Image.asset(Assets.announcement.path),
                  ),
                  const SizedBox(width: 17),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppLocalizations.of(context)!.paymentSucessful,
                          style: AppTextStyle.extraBold12,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          generalNofifications.title ?? '',
                          style: AppTextStyle.medium12,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  generalNofifications.createdAt!.formattedDate(),
                  style: AppTextStyle.medium12,
                ),
                const SizedBox(height: 8),
                Text(
                  generalNofifications.createdAt!.formattedTime(),
                  style: AppTextStyle.medium12,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
