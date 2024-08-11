import 'package:dio/dio.dart';
import 'package:obhijuk/src/core/network/end_points.dart';
import 'package:obhijuk/src/core/network/rest_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'notification_data_source.g.dart';
part 'notification_data_source_imp.dart';

@Riverpod(keepAlive: true)
NotificationDataSource notificationDataSource(NotificationDataSourceRef ref) {
  return NotificationDataSourceImpl(
    restClient: ref.read(restClientProvider),
  );
}

abstract class NotificationDataSource {
  Future<Response> fetchNotification(String type);
}
