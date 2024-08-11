import 'package:intl/intl.dart';

extension IntExtensions on int {
  int get inMinutes => (this / 60).floor();

  int get inSeconds => this % 60;
}

extension DateTimeExtension on DateTime {
  String formattedDate() {
    return DateFormat.yMMMMd().format(toLocal()); // February 14, 2024
  }

  String formattedTime() {
    return DateFormat('h:mm a').format(toLocal()); // 3:30 PM
  }

  String formattedDateTime() {
    return DateFormat.yMd()
        .addPattern('h:mm a')
        .format(this); // 02/14/2024 3:30 PM
  }

  bool isBeforeLocal() {
    final localThis = toLocal();
    final localOther = DateTime.now().toLocal();
    return localThis.isBefore(localOther);
  }

  bool isAfterLocal() {
    final localThis = toLocal();
    final localOther = DateTime.now().toLocal();
    return localThis.isAfter(localOther);
  }

  bool isAtSameMomentAsLocal() {
    final localThis = toLocal();
    final localOther = DateTime.now().toLocal();
    return localThis.isAtSameMomentAs(localOther);
  }
}
