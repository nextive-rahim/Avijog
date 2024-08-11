import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/button.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Image.asset(
                      Assets.signinOtpPageLogo.path,
                      height: 183,
                      width: 185,
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
                  const SizedBox(height: 30),
                  OutlinedInputField(
                    labelText: AppLocalizations.of(context)!.password,
                    controller: TextEditingController(),
                    hintText:
                        AppLocalizations.of(context)!.enterEightDigitCharacter,
                  ),
                  OutlinedInputField(
                    labelText: AppLocalizations.of(context)!.confirmPassword,
                    controller: TextEditingController(),
                    hintText: AppLocalizations.of(context)!.confirmPassword,
                  ),
                  const SizedBox(height: 20),
                  Button(
                    label: AppLocalizations.of(context)!.submit,
                    onPressed: () {
                      context.goNamed(Routes.login);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
