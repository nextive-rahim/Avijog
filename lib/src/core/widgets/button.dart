import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.label,
    required this.onPressed,
    this.background,
    this.textStyle,
    this.scale = 1,
    this.height = 50,
    this.width = double.infinity,
    this.borderRadius = 10,
    this.isLoading = false,
    this.filled = true,
    this.prefix,
    this.disable = false,
  });

  final VoidCallback onPressed;
  final String label;
  final Color? background;
  final TextStyle? textStyle;
  final double scale;
  final double height;
  final double width;
  final double borderRadius;
  final bool filled;
  final bool isLoading;
  final Widget? prefix;
  final bool disable;

  factory Button.filled({
    required String label,
    required VoidCallback onPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double height = 50,
    double width = double.infinity,
    double borderRadius = 50,
    bool isLoading = false,
    Widget? prefix,
    bool disable = false,
  }) {
    return Button(
      label: label,
      onPressed: onPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      height: height,
      width: width,
      borderRadius: borderRadius,
      isLoading: isLoading,
      filled: true,
      prefix: prefix,
      disable: disable,
    );
  }

  factory Button.outlined({
    required String label,
    required VoidCallback onPressed,
    Color? background,
    TextStyle? textStyle,
    double scale = 1,
    double height = 50,
    double width = double.infinity,
    double borderRadius = 50,
    isLoading = false,
    Widget? prefix,
    bool disable = false,
  }) {
    return Button(
      label: label,
      onPressed: onPressed,
      background: background,
      textStyle: textStyle,
      scale: scale,
      height: height,
      width: width,
      borderRadius: borderRadius,
      isLoading: isLoading,
      filled: false,
      prefix: prefix,
      disable: disable,
    );
  }

  @override
  Widget build(BuildContext context) {
    double height = this.height;

    return DecoratedBox(
      decoration: disable || filled == false
          ? const BoxDecoration()
          : BoxDecoration(
              color: background ?? AppColors.primary,
              // gradient: const LinearGradient(
              //   colors: [
              //     Color(0xFF0381E0),
              //     Color(0xFF045689),
              //   ],
              //   begin: Alignment.centerRight,
              //   end: Alignment.centerLeft,
              // ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
      child: ElevatedButton(
        onPressed: disable
            ? null
            : isLoading
                ? null
                : onPressed,
        style: filled
            ? ElevatedButton.styleFrom(
                elevation: 0,
                fixedSize: Size(width, height),
                backgroundColor: background ?? Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              )
            : ElevatedButton.styleFrom(
                shadowColor: Colors.transparent,
                elevation: 0,
                fixedSize: Size(width, height),
                backgroundColor:
                    disable ? Colors.grey : background ?? Colors.transparent,
                side: BorderSide(
                  color: isLoading ? Colors.transparent : Colors.blue,
                  width: 1,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isLoading
                ? Transform.scale(
                    scale: scale,
                    child: const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(Colors.white),
                      ),
                    ),
                  )
                : prefix == null
                    ? Text(
                        label,
                        style: textStyle ?? _labelTextStyle(),
                      )
                    : Row(
                        children: [
                          prefix!,
                          SizedBox(width: 10.w),
                          Text(
                            label,
                            style: textStyle ?? _labelTextStyle(),
                          ),
                        ],
                      ),
          ],
        ),
      ),
    );
  }

  TextStyle _labelTextStyle() {
    return TextStyle(
      color: filled ? Colors.white : Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w600,
    );
  }
}
