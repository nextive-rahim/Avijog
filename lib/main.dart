import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/root.dart';
import 'package:obhijuk/src/core/logger/riverpod_logger.dart';
import 'package:obhijuk/src/features/language/domain/repositories/laguage_repository.dart';
import 'package:obhijuk/src/features/language/pages/riverpod/language_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final container = ProviderContainer();
  final language =
      await container.read(languageRepositoryProvider).getLanguage();

  runApp(
    ProviderScope(
      overrides: [languageProvider.overrideWith((ref) => language)],
      observers: [RiverpodLogger()],
      child: const Root(),
    ),
  );
}
