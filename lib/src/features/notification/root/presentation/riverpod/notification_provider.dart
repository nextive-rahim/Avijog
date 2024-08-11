import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/notification/root/domain/entities/notification_entity.dart';
import 'package:obhijuk/src/features/notification/root/domain/use_cases/notification_use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<NotificationEntity>> notification(
    NotificationRef ref, String type) async {
  final notificationUseCase = ref.read(notificationUseCaseProvider);

  ErrorModel? errorModel;
  List<NotificationEntity>? offerNotifications;

  (errorModel, offerNotifications) = await notificationUseCase.call(type);

  if (errorModel != null) {
    throw errorModel;
  } else {
    return offerNotifications ?? [];
  }
}
