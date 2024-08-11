import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'show_error_message_provider.g.dart';

@riverpod
class ShowErrorMessage extends _$ShowErrorMessage {
  @override
  String build() {
    return '';
  }

  String errorMessage(String errorMessage) {
    state = errorMessage;
    return state;
  }
}
