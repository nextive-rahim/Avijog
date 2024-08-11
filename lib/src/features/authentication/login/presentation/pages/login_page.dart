//part of 'verify_user_page.dart';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/service/cache/cache_keys.dart';
import 'package:obhijuk/src/core/service/cache/cache_service.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/form_validation.dart';
import 'package:obhijuk/src/core/widgets/gobal_snack_bar.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/core/widgets/primary_button.dart';
import 'package:obhijuk/src/features/authentication/forget_password/presentation/riverpod/forget_password_provider.dart';
import 'package:obhijuk/src/features/authentication/login/presentation/riverpod/login_provider.dart';
import 'package:obhijuk/src/features/authentication/otp/presentation/riverpod/otp_verification_provider.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/save_phone_number_provider.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/show_error_message_provider.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final cacheService = ref.watch(cacheServiceProvider);
    ref.listen(
      loginProvider,
      (previous, next) {
        if (next.hasError) {
          GlobalSnackBar.show(context, next.asError!.error.toString());
        }
      },
    );
    ref.listen(
      forgetPasswordProvider,
      (previous, next) {
        if (next is AsyncError) {
          GlobalSnackBar.show(context, ref.watch(showErrorMessageProvider));
        }
      },
    );
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      AppLocalizations.of(context)!.welcomeBack,
                      style: AppTextStyle.bold28,
                    ),
                  ),
                  const SizedBox(height: 20),
                  20.sh,
                  Text(
                    AppLocalizations.of(context)!.loginSubTitle,
                    textAlign: TextAlign.center,
                    style: AppTextStyle.medium18,
                  ),
                  40.sh,
                  Form(
                    key: _formKey,
                    child: OutlinedInputField(
                      maxLines: 1,
                      keyboardType: TextInputType.visiblePassword,
                      isPasswordField: true,
                      labelText: AppLocalizations.of(context)!.password,
                      controller: _passwordController,
                      hintText: AppLocalizations.of(context)!
                          .enterEightDigitCharacter,
                      validator: InputFieldValidator.password(),
                    ),
                  ),
                  _forgetPassword(),
                  40.sh,
                  PrimaryButton(
                    isLoading: ref.watch(loginProvider) is AsyncLoading<void>,
                    onTap: () async {
                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      ref.read(loginProvider.notifier).login({
                        "phone": ref.watch(saveNumberProvider),
                        "password": _passwordController.text,
                        'fcm_token': 'djilkysr7',
                      }).then(
                        (value) => context.goNamed(Routes.homeTab),
                      );
                    },
                    buttonText: AppLocalizations.of(context)!.login,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Builder _forgetPassword() {
    return Builder(builder: (context) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              ref
                  .read(otpVerificationProvider.notifier)
                  .otpVerification(phone: ref.watch(saveNumberProvider))
                  .then(
                    (value) => context.goNamed(
                      Routes.otp,
                      queryParameters: {
                        'isFrom': 'forgetPassword',
                      },
                    ),
                  );
            },
            child: Text(
              AppLocalizations.of(context)!.forgotPassword,
              style: const TextStyle(color: AppColors.primary),
            ),
          )
        ],
      );
    });
  }
}
