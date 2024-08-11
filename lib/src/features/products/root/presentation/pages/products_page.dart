import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';
import 'package:obhijuk/src/features/products/root/presentation/riverpod/products_provider.dart';
import 'package:obhijuk/src/features/products/root/presentation/riverpod/selected_category_provider.dart';
import 'package:obhijuk/src/features/products/root/presentation/widgets/product_card.dart';

part '../widgets/products_builder.dart';
part '../widgets/products_filter.dart';

class ProductsPage extends ConsumerWidget {
  const ProductsPage({
    super.key,
    this.vendorId,
    this.vendorName,
  });
  final String? vendorId;
  final String? vendorName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.primary,
        title: Text(
          vendorName ?? 'Products',
          style: const TextStyle(
            color: AppColors.white,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: AppColors.white,
          ),
        ),
        shape: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            _ProductsFilter(
              vendorId: vendorId,
            ),
            _ProductsBuilder(
              vendorId: vendorId,
            ),
          ],
        ),
      ),
    );
  }
}
