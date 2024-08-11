part of 'notification_data_source.dart';

class NotificationDataSourceImpl implements NotificationDataSource {
  NotificationDataSourceImpl({required this.restClient});
  final RestClient restClient;

  @override
  Future<Response> fetchNotification(String type) async {
    final response = await restClient.get(
      APIType.protected,
      API.notification + type,
    );

    return response;
  }
}
