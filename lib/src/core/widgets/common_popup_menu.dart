import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';

class CommonPopupMenu extends ConsumerWidget {
  const CommonPopupMenu({
    super.key,
    required this.onSelected,
    required this.data,
    this.selectedValue,
  });
  final void Function(String)? onSelected;
  final List<String> data;
  final String? selectedValue;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopupMenuButton<String>(
      color: AppColors.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      onSelected: onSelected,
      itemBuilder: (context) {
        return [
          for (var value in data)
            PopupMenuItem(
              value: value,
              child: Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            )
        ];
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Text(selectedValue!),
          ),
          const Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}
