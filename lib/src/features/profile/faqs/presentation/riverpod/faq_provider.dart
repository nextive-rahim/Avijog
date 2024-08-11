import 'package:obhijuk/src/core/service/exception/error_model.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/faq_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/use_cases/profile_usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'faq_provider.g.dart';

@Riverpod(keepAlive: true)
Future<List<FaqEntity>?> faq(FaqRef ref) async {
  final profileUseCase = ref.read(profileUseCaseProvider);

  ErrorModel? errorModel;
  List<FaqEntity>? faqs;

  (errorModel, faqs) = await profileUseCase.callFaqs();

  if (errorModel != null) {
    throw errorModel;
  } else {
    return faqs;
  }
}

final faqDataProvider = Provider<FaqEntity>(
  (ref) => throw UnimplementedError(),
);
