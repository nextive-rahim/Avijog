import 'package:obhijuk/src/core/network/request_handler.dart';
import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/notification/root/data/data_source/notification_data_source.dart';
import 'package:obhijuk/src/features/notification/root/data/models/notification_model.dart';
import 'package:obhijuk/src/features/notification/root/domain/entities/notification_entity.dart';
import 'package:obhijuk/src/features/notification/root/domain/repositories/notification_repository.dart';

class NotificationRepositoryImpl implements NotificationRepository {
  NotificationRepositoryImpl({required this.dataSource});
  final NotificationDataSource dataSource;

  @override
  Future<(ErrorModel?, List<NotificationEntity>?)> getNotification(
      String type) async {
    return await dataSource.fetchNotification(type).guard(
      (data) {
        List<NotificationEntity>? notifications =
            (data as List).map((e) => NotificationModel.fromJson(e)).toList();
        return notifications;
      },
    );
  }
}
