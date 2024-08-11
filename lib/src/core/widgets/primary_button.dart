import 'package:flutter/material.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    super.key,
    required this.onTap,
    this.isLoading = false,
    required this.buttonText,
    this.backgroundColor,
  });

  final Function onTap;
  final bool isLoading;
  final String buttonText;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.primary,
      ),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
        ),
        onPressed: isLoading ? null : () => onTap(),
        child: isLoading
            ? const Center(
                child: SizedBox(
                  height: 25,
                  width: 25,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    backgroundColor: Colors.white,
                  ),
                ),
              )
            : Text(
                buttonText,
                style: AppTextStyle.bold16.copyWith(color: AppColors.white),
              ),
      ),
    );
  }
}
