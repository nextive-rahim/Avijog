part of '../pages/payment_history_page.dart';

class MonthFilteringCard extends ConsumerWidget {
  const MonthFilteringCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final monthProvider = ref.watch(selectedMonthProvider);
    final yearProvider = ref.watch(selectedYearProvider);
    final language = ref.watch(languageProvider);
    final List<String> monthList = [
      AppLocalizations.of(context)!.january,
      AppLocalizations.of(context)!.february,
      AppLocalizations.of(context)!.march,
      AppLocalizations.of(context)!.april,
      AppLocalizations.of(context)!.may,
      AppLocalizations.of(context)!.june,
      AppLocalizations.of(context)!.july,
      AppLocalizations.of(context)!.august,
      AppLocalizations.of(context)!.september,
      AppLocalizations.of(context)!.october,
      AppLocalizations.of(context)!.november,
      AppLocalizations.of(context)!.december,
    ];
    final List<String> yearList = [
      AppLocalizations.of(context)!.year2024,
      AppLocalizations.of(context)!.year2025,
    ];

    return Row(
      children: [
        Flexible(
          child: Consumer(
            builder: (context, ref, child) {
              return OutlinedInputField(
                readOnly: true,
                controller: TextEditingController(),
                hintText: '',
                suffix: CommonPopupMenu(
                    data: monthList,
                    onSelected: (value) {
                      if (language.code == 'bn') {
                        ref
                            .read(selectedMonthProvider.notifier)
                            .update((state) => value.banglaToEnglishMonth);
                      } else {
                        ref
                            .read(selectedMonthProvider.notifier)
                            .update((state) => value);
                      }
                    },
                    selectedValue: language.code == 'bn'
                        ? monthProvider?.englishToBanglaMonth ??
                            AppLocalizations.of(context)!.selectMonth
                        : monthProvider ??
                            AppLocalizations.of(context)!.selectMonth),
              );
            },
          ),
        ),
        10.sw,
        Flexible(
          child: Consumer(
            builder: (context, ref, child) {
              return OutlinedInputField(
                readOnly: true,
                // labelText: AppLocalizations.of(context)!.studyLevel,
                controller: TextEditingController(),
                hintText: AppLocalizations.of(context)!.enterinstituteName,
                suffix: CommonPopupMenu(
                  data: yearList,
                  onSelected: (value) {
                    if (language.code == 'bn') {
                      ref
                          .read(selectedYearProvider.notifier)
                          .update((state) => value.banglaToEnglishYear);
                    } else {
                      ref
                          .read(selectedYearProvider.notifier)
                          .update((state) => value);
                    }
                  },
                  selectedValue: language.code == 'bn'
                      ? yearProvider?.englishToBanglaYear ??
                          AppLocalizations.of(context)!.selectYear
                      : yearProvider ??
                          AppLocalizations.of(context)!.selectYear,
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
