import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/form_validation.dart';
import 'package:obhijuk/src/core/widgets/gobal_snack_bar.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/core/widgets/primary_button.dart';
import 'package:obhijuk/src/features/authentication/forget_password/presentation/riverpod/forget_password_provider.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/save_phone_number_provider.dart';

class ForgetPasswordPage extends ConsumerWidget {
  ForgetPasswordPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(forgetPasswordProvider, (previous, next) {
      if (next is AsyncData) {
        if (next.value?.status == 200) {
          GlobalSnackBar.show(
            context,
            next.value?.message ?? 'Password reset successfully',
          );

          context.goNamed(Routes.login);
        } else {
          GlobalSnackBar.show(
            context,
            next.value?.message ?? 'Something went wrong',
          );
        }
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Center(
                        child: Image.asset(
                          Assets.signinOtpPageLogo.path,
                          height: 150,
                          width: 150,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Center(
                        child: Text(
                          AppLocalizations.of(context)!.setNewPassword,
                          style: AppTextStyle.bold28,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        AppLocalizations.of(context)!.setNewPasswordCaption,
                        textAlign: TextAlign.center,
                        style: AppTextStyle.medium18,
                      ),
                      30.sh,
                      OutlinedInputField(
                        labelText: AppLocalizations.of(context)!.password,
                        controller: _passwordController,
                        hintText: AppLocalizations.of(context)!
                            .enterEightDigitCharacter,
                        validator: InputFieldValidator.password(),
                      ),
                      OutlinedInputField(
                        labelText:
                            AppLocalizations.of(context)!.confirmPassword,
                        controller: _confirmPasswordController,
                        hintText: AppLocalizations.of(context)!.confirmPassword,
                        validator: InputFieldValidator.confirmPassword(
                          password: _passwordController.text,
                          optional: _passwordController.text.isEmpty,
                        ),
                      ),
                      20.sh,
                      PrimaryButton(
                        isLoading:
                            ref.watch(forgetPasswordProvider) is AsyncLoading,
                        onTap: () {
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }
                          ref
                              .watch(forgetPasswordProvider.notifier)
                              .forgetPassword(
                                phone: ref.read(saveNumberProvider),
                                password: _passwordController.text,
                                confirmPassword:
                                    _confirmPasswordController.text,
                              );
                        },
                        buttonText: AppLocalizations.of(context)!.submit,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
}
