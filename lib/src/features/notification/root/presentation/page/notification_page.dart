import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/enums/enums.dart';
import 'package:obhijuk/src/core/extension/string_extension.dart';
import 'package:obhijuk/src/core/extension/time_extension.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/app_dialog.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/core/widgets/list_view_loading.dart';
import 'package:obhijuk/src/features/notification/root/domain/entities/notification_entity.dart';
import 'package:obhijuk/src/features/notification/root/presentation/riverpod/notification_provider.dart';

part '../../../general_notification/presentation/pages/general_notification_tab.dart';
part '../../../general_notification/presentation/widgets/general_notification_card.dart';
part '../../../general_notification/presentation/widgets/general_notification_list_builder.dart';
part '../../../offer_notification/presentation/pages/offer_notification_tab.dart';
part '../../../offer_notification/presentation/widgets/offer_notification_card.dart';
part '../../../offer_notification/presentation/widgets/offer_notification_list_builder.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text(
          AppLocalizations.of(context)!.notification,
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
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        // ignore: avoid_unnecessary_containers
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 57,
                decoration: BoxDecoration(
                  color: AppColors.lighterBlue,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: TabBar(
                  controller: _tabController,
                  isScrollable: false,
                  indicatorWeight: 0,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorPadding: const EdgeInsets.symmetric(vertical: 0),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 00,
                    vertical: 0,
                  ),
                  labelColor: AppColors.white,
                  unselectedLabelColor: AppColors.primary,
                  labelPadding: const EdgeInsets.only(
                    left: 5,
                    right: 5,
                  ),
                  unselectedLabelStyle: AppTextStyle.medium16.copyWith(
                    height: 21 / 16,
                  ),
                  indicator: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  labelStyle: AppTextStyle.bold20.copyWith(
                    height: 21 / 16,
                  ),
                  tabs: [
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.offer,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                    Tab(
                      child: Text(
                        AppLocalizations.of(context)!.general,
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  controller: _tabController,
                  children: const [
                    OfferNotificationTab(),
                    GeneralNotificationTab(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
