import 'package:flutter/material.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/core/theme/text_style.dart';

class GlobalSnackBar {
  final String? message;

  const GlobalSnackBar({
    @required this.message,
  });

  static show(
    BuildContext context,
    String message,
  ) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: AppColors.lighterBlue,
        elevation: 5.0,
        padding: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: AppTextStyle.bold15.copyWith(
            color: AppColors.lightBlack90,
          ),
        ),
        duration: const Duration(seconds: 3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
