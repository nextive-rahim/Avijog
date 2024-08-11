import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/features/language/pages/language.dart';
import 'package:obhijuk/src/features/language/pages/riverpod/language_provider.dart';

class LanguagePopupMenu extends ConsumerWidget {
  const LanguagePopupMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languageSelectedProvider = ref.watch(languageProvider);
    return PopupMenuButton<Language>(
      onSelected: (value) {
        ref.read(languageProvider.notifier).update((state) => value);
        print(value);
      },
      itemBuilder: (context) {
        return [
          for (var value in Language.values)
            PopupMenuItem(value: value, child: Text(value.name))
        ];
      },
      child: Text('Language ${languageSelectedProvider.code}'),
    );
  }
}
