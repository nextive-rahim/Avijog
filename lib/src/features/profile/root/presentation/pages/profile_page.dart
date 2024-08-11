import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:obhijuk/src/core/contstant_data/contstant_data.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/extension/url_launcher.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/service/cache/cache_keys.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/app_dialog.dart';
import 'package:obhijuk/src/core/widgets/button.dart';
import 'package:obhijuk/src/core/widgets/cached_network_image.dart';
import 'package:obhijuk/src/core/widgets/form_validation.dart';
import 'package:obhijuk/src/core/widgets/gobal_snack_bar.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/features/language/domain/repositories/laguage_repository.dart';
import 'package:obhijuk/src/features/language/pages/language.dart';
import 'package:obhijuk/src/features/language/pages/riverpod/language_provider.dart';
import 'package:obhijuk/src/features/profile/faqs/presentation/riverpod/faq_provider.dart';
import 'package:obhijuk/src/features/profile/pin_change/presentation/riverpod/pin_change_provider.dart';
import 'package:obhijuk/src/features/profile/privacy_policy/presentation/riverpod/privacy_policy_provider.dart';
import 'package:obhijuk/src/features/profile/profile_update/presentation/riverpod/image_picker_provider.dart';
import 'package:obhijuk/src/features/profile/profile_update/presentation/riverpod/update_profile_provider.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/faq_entity.dart';
import 'package:obhijuk/src/features/profile/root/domain/entities/user_entity.dart';
import 'package:obhijuk/src/features/profile/root/presentation/riverpod/user_provider.dart';
import 'package:obhijuk/src/features/profile/user_guide/presentation/riverpod/user_guide_provider.dart';
import 'package:package_info_plus/package_info_plus.dart';

part '../../../faqs/presentation/pages/faq_page.dart';
part '../../../faqs/presentation/widgets/faq_card.dart';
part '../../../faqs/presentation/widgets/faq_list_builder.dart';
part '../../../pin_change/presentation/pages/pin_change.dart';
part '../../../privacy_policy/presentation/pages/privacy_policy_page.dart';
part '../../../profile_update/presentation/pages/profile_update_page.dart';
part '../../../user_guide/presentation/pages/user_guide_page.dart';
part '../widgets/profile_body_section.dart';
part '../widgets/profile_header.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lighterBlue,
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.profile,
          style: AppTextStyle.extraBold24.copyWith(
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primary,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
      ),
      body: const SafeArea(
        child: Column(
          children: [
            ProfileHeaderSection(),
            ProfileBodySection(),
          ],
        ),
      ),
    );
  }
}
