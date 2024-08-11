part of '../pages/products_page.dart';

class _ProductsBuilder extends ConsumerWidget {
  const _ProductsBuilder({
    super.key,
    this.vendorId,
  });
  final String? vendorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedCategory = ref.watch(selectedCategoryProvider);
    final asyncProducts = ref.watch(productsProvider(
      vendorId: vendorId,
    ));

    return Expanded(
      child: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(selectedCategoryProvider);
          ref.invalidate(productsProvider(
            vendorId: vendorId,
          ));
        },
        child: Stack(
          children: [
            ListView(
              physics: const AlwaysScrollableScrollPhysics(),
            ),
            asyncProducts.when(
              data: (allProducts) {
                List<ProductEntity> products = [];

                if (selectedCategory == null) {
                  products = allProducts;
                } else {
                  products = allProducts
                      .where((product) => product.category == selectedCategory)
                      .toList();
                }

                if (products.isEmpty) {
                  return const Center(
                    child: Text('No products found'),
                  );
                }

                return GridView.builder(
                  padding: const EdgeInsets.only(bottom: 150),
                  itemCount: products.length,
                  primary: false,
                  physics: const AlwaysScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: .69,
                  ),
                  itemBuilder: (context, index) {
                    ProductEntity product = products[index];

                    return ProductCard(
                      product: product,
                    );
                  },
                );
              },
              loading: () => _buildProductsLoader(),
              error: (error, _) => const Center(
                child: Text('No products found'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProductsLoader() {
    return GridView.builder(
      padding: const EdgeInsets.only(
        bottom: 150,
        top: 20,
      ),
      itemCount: 10,
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        childAspectRatio: 165 / 240,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
            color: AppColors.lighterBlue,
            borderRadius: BorderRadius.circular(10),
          ),
        );
      },
    );
  }
}
