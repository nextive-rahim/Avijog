import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/features/home/presentation/riverpod/vendor_sate_notifier_provider.dart';

final vendorsNotificationProvider =
    StateNotifierProvider<VendorsNotifier, List<String>>(
        (ref) => VendorsNotifier(ref: ref));
final isExpandedProvider = StateProvider<bool>((ref) => false);
