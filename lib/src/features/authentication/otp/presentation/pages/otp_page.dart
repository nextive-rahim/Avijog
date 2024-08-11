import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:obhijuk/src/core/extension/sized_box_extension.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/routes/app_routes.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';
import 'package:obhijuk/src/core/widgets/form_validation.dart';
import 'package:obhijuk/src/core/widgets/gobal_snack_bar.dart';
import 'package:obhijuk/src/core/widgets/outlined_input_field.dart';
import 'package:obhijuk/src/core/widgets/primary_button.dart';
import 'package:obhijuk/src/features/authentication/login/presentation/riverpod/verify_user_provider.dart';
import 'package:obhijuk/src/features/authentication/otp/presentation/riverpod/otp_verification_provider.dart';
import 'package:obhijuk/src/features/authentication/root/presentation/riverpod/save_phone_number_provider.dart';

class OtpPage extends ConsumerStatefulWidget {
  const OtpPage({
    super.key,
    required this.isFrom,
  });
  final String isFrom;

  @override
  ConsumerState<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends ConsumerState<OtpPage> {
  final _formKey = GlobalKey<FormState>();
  final _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                const SizedBox(height: 51),
                Text(
                  AppLocalizations.of(context)!.verifyYourNumber,
                  style: AppTextStyle.bold28,
                ),
                20.sh,
                Text(
                  AppLocalizations.of(context)!.enterOtp,
                  textAlign: TextAlign.center,
                  style: AppTextStyle.medium18,
                ),
                30.sh,
                Form(
                  key: _formKey,
                  child: OutlinedInputField(
                    keyboardType: TextInputType.number,
                    controller: _otpController,
                    hintText: AppLocalizations.of(context)!.enterYourOtp,
                    validator: InputFieldValidator.otp(),
                  ),
                ),
                // 40.sh,
                PrimaryButton(
                  onTap: _onTap,
                  buttonText: AppLocalizations.of(context)!.verify,
                ),
                32.sh,
                Text(
                  AppLocalizations.of(context)!.otpConfirmation,
                  style: AppTextStyle.medium14,
                ),
                10.sh,
                _ResendOTP(
                  isUserVerification: widget.isFrom == 'userVerification',
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    if (widget.isFrom == 'userVerification') {
      final otpToVerify = ref.watch(verifyUserProvider).maybeWhen(
            orElse: () => null,
            data: (data) => data.data?.otp,
          );

      if (otpToVerify != _otpController.text) {
        GlobalSnackBar.show(context, 'OTP is not valid!');
        return;
      }

      context.goNamed(Routes.signup);
      return;
    } else {
      final otpToVerify = ref.watch(otpVerificationProvider).maybeWhen(
            orElse: () => null,
            data: (data) => data.otp,
          );

      if (otpToVerify != _otpController.text) {
        GlobalSnackBar.show(context, 'OTP is not valid!');
        return;
      }

      context.goNamed(Routes.forgotPassword);
      return;
    }
  }
}

class _ResendOTP extends ConsumerStatefulWidget {
  const _ResendOTP({required this.isUserVerification});
  final bool isUserVerification;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ResendOTPState();
}

class _ResendOTPState extends ConsumerState<_ResendOTP> {
  late Timer? _timer;

  final ValueNotifier<int> _remainingTime = ValueNotifier<int>(60);
  final ValueNotifier<bool> _showTimer = ValueNotifier<bool>(true);
  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    _showTimer.value = true;
    if (_remainingTime.value == 0) {
      _remainingTime.value = 60;
    }
    _timer = Timer.periodic(
      const Duration(seconds: 1),
      (Timer timer) {
        if (_remainingTime.value == 0) {
          timer.cancel();
          _showTimer.value = false;
        } else {
          _remainingTime.value--;
        }
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _showTimer.value = false;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isOtpProviderLoading = ref.exists(otpVerificationProvider) &&
        ref.watch(otpVerificationProvider) is AsyncLoading<void>;
    bool isVerifyUserProviderLoading = ref.exists(verifyUserProvider) &&
        ref.watch(verifyUserProvider) is AsyncLoading<void>;

    return ValueListenableBuilder<bool>(
      valueListenable: _showTimer,
      builder: (BuildContext context, bool showTimer, child) {
        return InkWell(
          onTap:
              (showTimer || isOtpProviderLoading || isVerifyUserProviderLoading)
                  ? null
                  : () {
                      if (widget.isUserVerification) {
                        ref
                            .read(verifyUserProvider.notifier)
                            .checkUserVerification(
                              phoneNumber: ref.watch(saveNumberProvider),
                            )
                            .then(
                          (value) {
                            startTimer();
                            return GlobalSnackBar.show(
                              context,
                              'OTP has been sent to your number!',
                            );
                          },
                        );
                      } else {
                        ref
                            .read(otpVerificationProvider.notifier)
                            .otpVerification(
                              phone: ref.watch(saveNumberProvider),
                            )
                            .then(
                          (value) {
                            startTimer();
                            return GlobalSnackBar.show(
                              context,
                              'OTP has been sent to your number!',
                            );
                          },
                        );
                      }
                    },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (isOtpProviderLoading || isVerifyUserProviderLoading)
                  ? const CupertinoActivityIndicator(
                      color: AppColors.primary,
                      radius: 8,
                    )
                  : ValueListenableBuilder<bool>(
                      valueListenable: _showTimer,
                      builder: (BuildContext context, bool showTimer, child) {
                        return showTimer
                            ? ValueListenableBuilder<int>(
                                valueListenable: _remainingTime,
                                builder:
                                    (BuildContext context, int value, child) {
                                  return Text(
                                    'Resend in: $value',
                                    style: AppTextStyle.bold16,
                                  );
                                },
                              )
                            : Text(
                                AppLocalizations.of(context)!.resendCode,
                                style: AppTextStyle.bold16
                                    .copyWith(color: AppColors.primary),
                              );
                      },
                    )
            ],
          ),
        );
      },
    );
  }
}
