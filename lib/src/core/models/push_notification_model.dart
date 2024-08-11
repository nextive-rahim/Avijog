class ReceivedNotification {
  ReceivedNotification({
    required this.id,
    required this.title,
    this.body,
    this.image,
    this.payload,
  });

  final int id;
  final String? title;
  final String? body;
  final String? image;
  final String? payload;
}
