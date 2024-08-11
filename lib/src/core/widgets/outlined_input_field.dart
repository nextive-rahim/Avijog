import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';

class OutlinedInputField extends StatefulWidget {
  const OutlinedInputField({
    super.key,
    required this.controller,
    required this.hintText,
    this.prefix,
    this.suffix,
    this.keyboardType,
    this.textInputAction,
    this.isPasswordField = false,
    this.onChanged,
    this.validator,
    this.inputFormatters,
    this.maxLines = 1,
    this.minLines,
    this.fillColor,
    this.bottomPadding,
    this.showBorder = false,
    this.height,
    this.borderColor,
    this.readOnly = false,
    this.isEnabled = true,
    this.labelText,
    // this.autofilled,
    this.labelTextColor,
    this.onSubmitted,
  });

  final TextEditingController controller;
  final String hintText;
  final Widget? prefix;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final bool isPasswordField;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLines;
  final int? minLines;
  final Color? fillColor;
  final double? bottomPadding;
  final bool? showBorder;
  final double? height;
  final Color? borderColor;
  final bool? readOnly;
  final bool? isEnabled;
  final String? labelText;
  // final String? autofilled;
  final Color? labelTextColor;
  final Function(String)? onSubmitted;

  @override
  State<OutlinedInputField> createState() => _OutlinedInputFieldState();
}

class _OutlinedInputFieldState extends State<OutlinedInputField> {
  final ValueNotifier<bool> showPassword = ValueNotifier<bool>(false);
  final ValueNotifier<bool> showError = ValueNotifier<bool>(false);
  final ValueNotifier<String?> errorMessage = ValueNotifier<String?>(null);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: widget.bottomPadding ?? 21),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.labelText ?? '',
            style: AppTextStyle.medium14
                .copyWith(color: widget.labelTextColor ?? AppColors.black),
          ),
          widget.showBorder == false
              ? const SizedBox(height: 14)
              : const Offstage(),
          SizedBox(
            width: double.infinity,
            child: ValueListenableBuilder<String?>(
              valueListenable: errorMessage,
              builder: (BuildContext context, String? value, child) {
                return TextFormField(
                  // autofillHints: <String>[widget.autofilled ?? ''],
                  readOnly: widget.readOnly!,
                  textAlign: TextAlign.left,
                  enabled: widget.isEnabled,
                  minLines: widget.minLines,
                  maxLines: widget.maxLines,
                  textAlignVertical: TextAlignVertical.center,
                  controller: widget.controller,
                  keyboardType: widget.keyboardType ?? TextInputType.text,
                  textInputAction:
                      widget.textInputAction ?? TextInputAction.next,
                  style: AppTextStyle.regular15.copyWith(
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                  ),
                  obscureText:
                      widget.isPasswordField ? !showPassword.value : false,
                  decoration: InputDecoration(
                    disabledBorder: widget.isEnabled == false
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: AppColors.inputBorder,
                            ),
                          )
                        : null,
                    enabledBorder: widget.showBorder == false
                        ? OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                              width: 0.5,
                              color: AppColors.primary,
                            ),
                          )
                        : Theme.of(context)
                            .inputDecorationTheme
                            .enabledBorder
                            ?.copyWith(
                              borderSide: BorderSide(
                                color: widget.borderColor ?? AppColors.primary,
                                width: 0.5,
                              ),
                            ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: widget.showBorder == false
                            ? Colors.transparent
                            : AppColors.primary,
                      ),
                    ),
                    filled: true,
                    fillColor: widget.isEnabled == false
                        ? AppColors.grey100
                        : widget.fillColor ?? AppColors.lighterBlue,
                    prefixIcon: widget.prefix,
                    suffixIcon: widget.isPasswordField
                        ? _passwordSuffix()
                        : widget.suffix,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    isDense: true,
                    hintText: widget.hintText,
                    hintStyle: const TextStyle(color: AppColors.hintText),
                  ),
                  inputFormatters: widget.inputFormatters,
                  onFieldSubmitted: widget.onSubmitted,
                  onChanged: (v) {
                    if (showError.value) {
                      showError.value = false;
                    }
                    if (widget.onChanged != null) {
                      widget.onChanged!(v);
                    }
                  },
                  validator: (v) {
                    if (widget.validator != null) {
                      errorMessage.value = widget.validator!(v);
                      showError.value = true;
                      return errorMessage.value;
                    }
                    return null;
                  },
                );
              },
            ),
          ),
          ValueListenableBuilder<bool>(
            valueListenable: showError,
            builder: (BuildContext context, bool value, child) {
              return ValueListenableBuilder<String?>(
                valueListenable: errorMessage,
                builder: (BuildContext context, String? value, child) {
                  if (showError.value && errorMessage.value != null) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                        left: 5,
                      ),
                      child: Text(
                        value.toString(),
                        style: const TextStyle(color: Colors.red),
                      ),
                    );
                  } else {
                    return const Offstage();
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }

  IconButton _passwordSuffix() {
    return IconButton(
      onPressed: () {
        setState(() {
          showPassword.value = !showPassword.value;
        });
      },
      icon: Icon(
        !showPassword.value
            ? Icons.visibility_outlined
            : Icons.visibility_off_outlined,
        color: AppColors.primary,
        size: 20,
      ),
    );
  }
}
