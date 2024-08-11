import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/notification/root/domain/entities/notification_entity.dart';
import 'package:obhijuk/src/features/notification/root/domain/repositories/notification_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_use_cases.g.dart';

@Riverpod()
NotificationUseCase notificationUseCase(NotificationUseCaseRef ref) {
  return NotificationUseCase(
    notificationRepository: ref.read(notificationRepositoryProvider),
  );
}

class NotificationUseCase {
  NotificationUseCase({required this.notificationRepository});
  final NotificationRepository notificationRepository;

  Future<(ErrorModel?, List<NotificationEntity>?)> call(String type) async {
    return await notificationRepository.getNotification(type);
  }
}
