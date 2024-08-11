import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:obhijuk/src/features/home/presentation/riverpod/vendor_provider.dart';

class VendorsNotifier extends StateNotifier<List<String>> {
  VendorsNotifier({required this.ref}) : super([]) {
    initialVendorsList();
  }
  final Ref ref;

  List<String> intialVendors = [];
  int pages = 0;
  int perPageItem = 6;
  List<String> allVendors = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'A',
    'B',
    'A',
    'B',
  ];

  void initialVendorsList() {
    state = allVendors;
    allVendors.isNotEmpty && state.length > 6
        ? intialVendors.addAll(state.getRange(pages, pages + perPageItem))
        : null;
    pages = pages + perPageItem;
  }

  void loadMoreInstructors() {
    intialVendors.addAll(state.getRange(pages, state.length));
    ref.read(isExpandedProvider.notifier).update((state) => true);
  }

  void lessInstructors() {
    pages = 0;
    perPageItem = 6;
    intialVendors.clear();
    intialVendors.addAll(state.getRange(pages, pages + perPageItem));
    pages = pages + perPageItem;
    ref.read(isExpandedProvider.notifier).update((state) => false);
  }
}
