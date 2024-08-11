part of '../pages/home_page.dart';

class BannerWidget extends ConsumerStatefulWidget {
  const BannerWidget({super.key});

  @override
  ConsumerState<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends ConsumerState<BannerWidget> {
  int _current = 0;
  final CarouselController _carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    final asyncBanners = ref.watch(bannersProvider);

    return asyncBanners.when(
      data: (banners) {
        if (banners.isEmpty) {
          return const Offstage();
        }

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CarouselSlider(
                carouselController: _carouselController,
                options: CarouselOptions(
                  scrollDirection: Axis.horizontal,
                  enlargeCenterPage: true,
                  viewportFraction: 1,
                  autoPlay: true,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                items: banners.map(
                  (item) {
                    return GestureDetector(
                      onTap: () {
                        _onTap(item);
                      },
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: AppCachedNetworkImage(
                          image: item.image,
                          fit: BoxFit.contain,
                        ),
                      ),
                    );
                  },
                ).toList(),
              ),
              (banners.isNotEmpty)
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: banners.asMap().entries.map((entry) {
                        return GestureDetector(
                          onTap: () =>
                              _carouselController.animateToPage(entry.key),
                          child: Container(
                            width: (_current == entry.key ? 20 : 7),
                            height: 7,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10,
                              horizontal: 4,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: (AppColors.primary).withOpacity(
                                _current == entry.key ? 1 : 0.3,
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    )
                  : const Offstage(),
            ],
          ),
        );
      },
      loading: () {
        return AspectRatio(
          aspectRatio: 16 / 9,
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: AppColors.lighterBlue,
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
      error: (error, stack) => const Offstage(),
    );
  }

  _onTap(BannerEntity item) {
    if (item.link?.isNotEmpty ?? false) {
      urlLauncher(link: item.link);
    }
  }
}
