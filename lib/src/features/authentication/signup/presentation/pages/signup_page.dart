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
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/save_phone_number_provider.dart';
import 'package:obhijuk/src/features/authentication/signup/data/models/sign_up_payload_model.dart';
import 'package:obhijuk/src/features/authentication/signup/domain/entities/sign_up_payload_entity.dart';
import 'package:obhijuk/src/features/authentication/signup/presentation/riverpod/signup_provider.dart';

class SignUpPage extends ConsumerWidget {
  SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cacheService = ref.watch(cacheServiceProvider);
    ref.listen(signUpProvider, (previous, next) {
      if (next is AsyncError) {
        GlobalSnackBar.show(
          context,
          next.error.toString(),
        );
      }
    });

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Center(
              child: Column(
                children: [
                  //Center(
                  //   child: Container(
                  //     height: 92,
                  //     width: 92,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.grey100,
                  //       borderRadius: BorderRadius.circular(50),
                  //     ),
                  //   ),
                  // ),
                  const SizedBox(height: 21),
                  Text(
                    AppLocalizations.of(context)!.welcomeTo,
                    style: AppTextStyle.medium20,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    AppLocalizations.of(context)!.appName,
                    style: AppTextStyle.bold32,
                  ),
                  const SizedBox(height: 34),
                  Text(
                    AppLocalizations.of(context)!.createAnAccount,
                    style: AppTextStyle.bold20,
                  ),
                  40.sh,
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        OutlinedInputField(
                            keyboardType: TextInputType.name,
                            labelText:
                                AppLocalizations.of(context)!.affiliatorName,
                            controller: _nameController,
                            hintText:
                                AppLocalizations.of(context)!.enterYourFullName,
                            validator: InputFieldValidator.name()),
                        const SizedBox(height: 38),
                        Text(
                          AppLocalizations.of(context)!.studentInformation,
                          style: AppTextStyle.bold20,
                        ),
                        const SizedBox(height: 14),
                        OutlinedInputField(
                            keyboardType: TextInputType.name,
                            labelText:
                                AppLocalizations.of(context)!.instituteName,
                            controller: _institutionNameController,
                            hintText: AppLocalizations.of(context)!
                                .enterinstituteName,
                            validator: InputFieldValidator.name()),
                        OutlinedInputField(
                          keyboardType: TextInputType.emailAddress,
                          labelText: AppLocalizations.of(context)!.address,
                          controller: _addressController,
                          hintText: AppLocalizations.of(context)!.enterAddress,
                          validator: InputFieldValidator.email(),
                        ),
                        OutlinedInputField(
                          keyboardType: TextInputType.name,
                          labelText: AppLocalizations.of(context)!.reference,
                          controller: _referenceController,
                          hintText:
                              AppLocalizations.of(context)!.enterreference,
                        ),
                        OutlinedInputField(
                          labelText: AppLocalizations.of(context)!.password,
                          controller: _passwordController,
                          hintText: AppLocalizations.of(context)!.password,
                          validator: InputFieldValidator.password(),
                        ),
                        OutlinedInputField(
                          labelText:
                              AppLocalizations.of(context)!.confirmPassword,
                          controller: _confirmPasswordController,
                          hintText:
                              AppLocalizations.of(context)!.confirmPassword,
                          validator: InputFieldValidator.confirmPassword(
                            password: _passwordController.text,
                            optional: _passwordController.text.isEmpty,
                          ),
                        ),
                      ],
                    ),
                  ),
                  50.sh,
                  PrimaryButton(
                    isLoading: ref.watch(signUpProvider) is AsyncLoading<void>,
                    onTap: () async {
                      _formKey.currentState!.save();

                      if (!_formKey.currentState!.validate()) {
                        return;
                      }

                      SignUpPayloadEntity signUpPayload = SignUpPayloadEntity(
                        name: _nameController.text,
                        phone: ref.watch(saveNumberProvider),
                        institute: _institutionNameController.text,
                        address: _addressController.text,
                        reference: _referenceController.text.isEmpty
                            ? null
                            : _referenceController.text,
                        password: _passwordController.text,
                        fcmToken: await cacheService
                            .read(CacheKeys.fcmToken)
                            .then((value) => value),
                      );

                      ref
                          .read(signUpProvider.notifier)
                          .signUp(
                            payload:
                                SignUpPayloadModel.fromEntity(signUpPayload)
                                    .toJson(),
                          )
                          .then(
                            (value) => context.pushNamed(Routes.homeTab),
                          );
                    },
                    buttonText: AppLocalizations.of(context)!.signup,
                  ),
                  const SizedBox(height: 32),
                  _joinUsConfirmation(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _joinUsConfirmation(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppLocalizations.of(context)!.joinedUsBefore,
          style: AppTextStyle.medium14,
          textAlign: TextAlign.center,
        ),
        InkWell(
          onTap: () {
            context.goNamed(Routes.login);
          },
          child: Text(
            AppLocalizations.of(context)!.login,
            style: AppTextStyle.bold14.copyWith(
              color: AppColors.primary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _institutionNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _referenceController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
}
