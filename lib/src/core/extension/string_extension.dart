extension StringExtension on String? {
  bool get notificationLinkNotNull {
    return this != '' || this != null;
  }
}
