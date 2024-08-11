import 'package:flutter/material.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';

appDialog({
  required BuildContext context,
  required Function() onYesPressed,
  Function()? onNoPressed,
  final String? title,
  final String? description,
  final String? yesButtonText,
  final String? noButtonText,
  final Widget? bodyContent,
  final TextAlign? descriptionTextAlign,
  final String? icon,
  bool? isDismissible = true,
  bool showNoButton = true,
  bool? showYesButton = true,
}) {
  showDialog(
    context: context,
    barrierDismissible: isDismissible ?? false,
    builder: (_) {
      return WillPopScope(
        onWillPop: () async => isDismissible ?? false,
        child: AlertDialog(
          elevation: 0,
          contentPadding: const EdgeInsets.only(
            top: 20,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          content: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: bodyContent ??
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          if (icon != null)
                            Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Image.asset(
                                icon,
                                height: 40,
                                width: 40,
                              ),
                            ),
                          Text(
                            title ?? 'Are you sure?',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            description ?? 'Do you want to continue?',
                            textAlign: descriptionTextAlign ?? TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                ),
                Container(
                  height: 42,
                  width: double.maxFinite,
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (showNoButton == true)
                        Expanded(
                          child: GestureDetector(
                            onTap: onNoPressed ??
                                () => Navigator.of(context, rootNavigator: true)
                                    .pop(),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFFF3F4FA),
                                borderRadius:
                                    BorderRadius.circular(10).copyWith(
                                  topRight: showNoButton
                                      ? const Radius.circular(0)
                                      : null,
                                  bottomRight: showNoButton
                                      ? const Radius.circular(0)
                                      : null,
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  noButtonText ?? 'Cancel',
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      showYesButton == true
                          ? Expanded(
                              child: GestureDetector(
                                onTap: onYesPressed,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius:
                                        BorderRadius.circular(10).copyWith(
                                      topRight: showNoButton
                                          ? const Radius.circular(0)
                                          : null,
                                      bottomRight: showNoButton
                                          ? const Radius.circular(0)
                                          : null,
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      yesButtonText ?? 'Confirm',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          : const Offstage(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
