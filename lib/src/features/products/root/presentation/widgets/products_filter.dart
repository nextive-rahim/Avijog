part of '../pages/products_page.dart';

class _ProductsFilter extends ConsumerWidget {
  const _ProductsFilter({
    required this.vendorId,
  });
  final String? vendorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final category = ref.watch(selectedCategoryProvider);

    List<String?> productCategories = [];

    ref
        .watch(productsProvider(
          vendorId: vendorId,
        ))
        .maybeWhen(
            orElse: () => null,
            data: (products) {
              productCategories = products
                  .map((e) => e.category)
                  .toSet()
                  .toList()
                ..insert(0, 'All products');
            });

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    category ?? 'All products',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          offset: Offset(0, -5),
                        ),
                      ],
                      color: Colors.transparent,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.lighterBlue,
                      decorationThickness: 5,
                      decorationStyle: TextDecorationStyle.solid,
                    ),
                  ),
                ],
              ),
              PopUpMenuItems(
                categories: productCategories,
              )
            ],
          ),
        ],
      ),
    );
  }
}

class PopUpMenuItems extends ConsumerStatefulWidget {
  const PopUpMenuItems({super.key, required this.categories});
  final List<String?> categories;

  @override
  ConsumerState<PopUpMenuItems> createState() => _PopUpMenuItemsState();
}

class _PopUpMenuItemsState extends ConsumerState<PopUpMenuItems> {
  @override
  Widget build(BuildContext context) {
    final categoryNotifier = ref.read(selectedCategoryProvider.notifier);

    if (widget.categories.isEmpty) {
      return const SizedBox(
        height: 48,
      );
    }

    return MenuAnchor(
      builder:
          (BuildContext context, MenuController controller, Widget? child) {
        return IconButton(
          onPressed: () {
            if (controller.isOpen) {
              controller.close();
            } else {
              controller.open();
            }
          },
          icon: Image.asset(
            Assets.listMenu.path,
            height: 24,
            width: 24,
          ),
          tooltip: 'Show menu',
        );
      },
      menuChildren: List<MenuItemButton>.generate(
        widget.categories.length,
        (int index) => MenuItemButton(
          onPressed: () {
            if (widget.categories[index] == 'All products') {
              categoryNotifier.state = null;
            } else {
              categoryNotifier.state = widget.categories[index];
            }
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(widget.categories[index]!),
          ),
        ),
      ),
    );
  }
}
