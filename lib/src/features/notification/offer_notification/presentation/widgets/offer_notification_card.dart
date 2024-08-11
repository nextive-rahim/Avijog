part of '../../../root/presentation/page/notification_page.dart';

class OfferNotificationCard extends StatelessWidget {
  const OfferNotificationCard({super.key, required this.offers});
  final NotificationEntity offers;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        appDialog(
            context: context,
            showYesButton: offers.link!.notificationLinkNotNull ? true : false,
            yesButtonText: "Go To course",
            bodyContent: Column(
              children: [
                Text(
                  offers.title ?? '',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                AppCachedNetworkImage(
                  height: 200,
                  image: offers.image,
                  fit: BoxFit.fill,
                ),
                Text(
                  offers.body ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            onYesPressed: () {
              Navigator.pop(context);
              context.pushNamed(
                Routes.productDetails,
                queryParameters: {
                  'productId': offers.link,
                  'productName': offers.title,
                },
              );
              // GlobalSnackBar.show(context, 'Need to add course id');
            });
      },
      child: SizedBox(
        height: 157,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: AppCachedNetworkImage(
            image: offers.image,
            height: 157,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}
