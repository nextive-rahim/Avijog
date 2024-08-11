import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/features/products/root/domain/entities/product_entity.dart';

final selectedProductProvider = StateProvider<ProductEntity?>((ref) => null);
