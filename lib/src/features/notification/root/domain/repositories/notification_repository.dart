import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/notification/root/data/data_source/notification_data_source.dart';
import 'package:obhijuk/src/features/notification/root/data/repositories/notification_repository_imp.dart';
import 'package:obhijuk/src/features/notification/root/domain/entities/notification_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_repository.g.dart';

@Riverpod(keepAlive: false)
NotificationRepository notificationRepository(NotificationRepositoryRef ref) {
  return NotificationRepositoryImpl(
    dataSource: ref.read(notificationDataSourceProvider),
  );
}

abstract class NotificationRepository {
  Future<(ErrorModel?, List<NotificationEntity>?)> getNotification(String type);
}
