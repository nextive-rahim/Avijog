import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/features/language/pages/language.dart';

final languageProvider = StateProvider<Language>((ref) => Language.english);
