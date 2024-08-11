import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/form_validation.dart';
import 'package:obhijuk/src/core/widgets/gobal_snack_bar.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/core/widgets/primary_button.dart';
import 'package:obhijuk/src/features/authentication/login/presentation/riverpod/verify_user_provider.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/save_phone_number_provider.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/show_error_message_provider.dart';

class VerifyUserPage extends StatelessWidget {
  const VerifyUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  AppLocalizations.of(context)!.welcomeBack,
                  style: AppTextStyle.bold28,
                ),
                20.sh,
                Text(
                  AppLocalizations.of(context)!.loginSubTitle,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.medium18,
                ),
                const _UserVerificationSection()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UserVerificationSection extends ConsumerStatefulWidget {
  const _UserVerificationSection();

  @override
  ConsumerState<_UserVerificationSection> createState() =>
      _UserVerificationSectionState();
}

class _UserVerificationSectionState
    extends ConsumerState<_UserVerificationSection> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    ref.listen(
      verifyUserProvider,
      (previous, next) {
        if (next is AsyncError) {
          GlobalSnackBar.show(context, ref.watch(showErrorMessageProvider));
        }
      },
    );
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        40.sh,
        Form(
          key: _formKey,
          child: OutlinedInputField(
            keyboardType: TextInputType.phone,
            labelText: AppLocalizations.of(context)!.phoneNunber,
            controller: _phoneController,
            hintText: AppLocalizations.of(context)!.enterYourNunber,
            validator: InputFieldValidator.phoneNumber(),
          ),
        ),
        20.sh,
        SizedBox(
          height: 54,
          child: PrimaryButton(
            isLoading: ref.watch(verifyUserProvider) is AsyncLoading<void>,
            onTap: _onTab,
            buttonText: AppLocalizations.of(context)!.submit,
          ),
        ),
      ],
    );
  }

  void _onTab() {
    if (!_formKey.currentState!.validate()) {
      return;
    }
    ref
        .read(saveNumberProvider.notifier)
        .update((state) => _phoneController.text);
    ref
        .read(verifyUserProvider.notifier)
        .checkUserVerification(
          phoneNumber: _phoneController.text,
        )
        .then(
      (value) {
        if (value.data?.exists == true) {
          context.goNamed(
            Routes.passwordSubmit,
            queryParameters: {
              'phoneNumber': _phoneController.text,
            },
          );
        } else {
          context.pushNamed(
            Routes.otp,
            queryParameters: {
              'isFrom': 'userVerification',
            },
          );
        }
      },
    );
  }
}
