import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/features/language/pages/language.dart';
import 'package:obhijuk/src/features/language/pages/riverpod/language_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sharedPrefProvider =
    FutureProvider<SharedPreferences>((ref) => SharedPreferences.getInstance());
final languageRepositoryProvider =
    Provider<LanguageRepository>((ref) => LanguageRepository(ref: ref));

class LanguageRepository {
  LanguageRepository({required this.ref});
  final Ref ref;

  static const String languageCodeKey = 'language_code';
  Future<void> setLanguage(Language language) async {
    final pref = await ref.read(sharedPrefProvider.future);
    pref.setString(languageCodeKey, language.code);
    ref.read(languageProvider.notifier).update((state) => language);
  }

  Future<Language> getLanguage() async {
    final pref = await ref.read(sharedPrefProvider.future);
    final code = pref.getString(languageCodeKey);
    for (var value in Language.values) {
      if (value.code == code) return value;
    }
    return Language.english;
  }
}
