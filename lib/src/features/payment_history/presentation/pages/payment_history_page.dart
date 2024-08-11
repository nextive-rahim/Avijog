import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/core/contstant_data/contstant_data.dart';
import 'package:obhijuk/src/core/extension/generic_extension.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/extension/time_extension.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/core/widgets/common_popup_menu.dart';
import 'package:obhijuk/src/core/widgets/list_view_loading.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/features/language/pages/riverpod/language_provider.dart';
import 'package:obhijuk/src/features/payment_history/data/models/payment_history_model.dart';
import 'package:obhijuk/src/features/payment_history/domain/entities/payment_history_entity.dart';
import 'package:obhijuk/src/features/payment_history/presentation/riverpod/payment_history_provider.dart';

part '../widgets/month_filtering_card.dart';
part '../widgets/payment_history_builder.dart';
part '../widgets/payment_history_card.dart';

class PaymentHistoryPage extends ConsumerWidget {
  const PaymentHistoryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthProvider = ref.watch(selectedMonthProvider);
    final yearProvider = ref.watch(selectedYearProvider);
    final asyncPyamentHistoryProvider =
        monthProvider != null && yearProvider != null
            ? ref.watch(paymentHistoryProvider(monthProvider, yearProvider))
            : ref.watch(paymentHistoryProvider('', ''));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.history,
          style: const TextStyle(color: AppColors.white),
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.read(selectedMonthProvider.notifier).update((state) => null);
          return ref.refresh(paymentHistoryProvider('', ''));
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                const MonthFilteringCard(),
                switch (asyncPyamentHistoryProvider) {
                  AsyncError(:final error) => Text('Error: $error'),
                  AsyncData(:final value) =>
                    _PaymentHistoryBuilder(paymentHistory: value),
                  _ => const ListViewLoading(height: 250),
                },
              ],
            ),
          ),
        ),
      ),
    );
  }
}
