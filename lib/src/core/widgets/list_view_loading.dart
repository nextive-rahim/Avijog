import 'package:flutter/material.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';

class ListViewLoading extends StatelessWidget {
  const ListViewLoading({
    super.key,
    this.height = 70,
  });
  final int? height;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(top: 10),
          child: _LoadingCard(
            height: height!.toDouble(),
          ),
        );
      },
    );
  }
}

class _LoadingCard extends StatelessWidget {
  const _LoadingCard({super.key, this.height});
  final double? height;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.lighterBlue,
      ),
      height: height,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }
}
