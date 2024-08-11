part of '../pages/home_page.dart';

class AllVendors extends ConsumerStatefulWidget {
  const AllVendors({super.key});

  @override
  ConsumerState<AllVendors> createState() => _AllVendorsState();
}

class _AllVendorsState extends ConsumerState<AllVendors> {
  bool isExpanded = false;
  void toggleExpand() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  List<VendorEntity> vendors = [
    VendorEntity(logo: Assets.road.path, name: 'রাস্তা মেরামত'),
    VendorEntity(logo: Assets.mosque.path, name: 'মশা নিধন'),
    VendorEntity(logo: Assets.dustbin.path, name: 'আবর্জনা'),
    VendorEntity(logo: Assets.lighting.path, name: 'সড়ক বাতি'),
    VendorEntity(logo: Assets.toilet.path, name: 'পাবলিক টয়লেট'),
    VendorEntity(logo: Assets.nardoma.path, name: 'নর্দমা'),
    VendorEntity(logo: Assets.illegelconstruction.path, name: 'অবৈধ স্থাপনা'),
    VendorEntity(logo: Assets.waterflowing.path, name: 'জলাবদ্ধতা')
  ];
  @override
  Widget build(BuildContext context) {
    // final asyncVendors = ref.watch(allVendorsProvider);

    return
        // asyncVendors.when(
        //   data: (vendors) {
        //     if (vendors.isEmpty) {
        //       return const Offstage();
        //     }

        //     return
        Padding(
      padding: const EdgeInsets.only(
        top: 20,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 9,
                width: 9,
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                AppLocalizations.of(context)!.allVendors,
                style: AppTextStyle.bold16,
              )
            ],
          ),
          const SizedBox(height: 20),
          Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: _getExtendedHeight(8),
                child: _VendorGrideViewBuilder(
                  vendors: vendors,
                ),
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child: AnimatedContainer(
              //     duration: const Duration(milliseconds: 300),
              //     height: 80,
              //     decoration: (!isExpanded && vendors.length > 6)
              //         ? BoxDecoration(
              //             gradient: LinearGradient(
              //               begin: Alignment.topCenter,
              //               end: Alignment.bottomCenter,
              //               colors: [
              //                 Colors.white30.withOpacity(.1),
              //                 AppColors.white
              //               ],
              //             ),
              //           )
              //         : null,
              //   ),
              // ),
              // Positioned(
              //   bottom: isExpanded ? 0 : 10,
              //   left: 100,
              //   right: 100,
              //   child: vendors.length > 6
              //       ? ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //             backgroundColor:
              //                 AppColors.primary.withOpacity(.9),
              //             shape: RoundedRectangleBorder(
              //               borderRadius: BorderRadius.circular(15),
              //             ),
              //           ),
              //           onPressed: toggleExpand,
              //           child: Text(
              //             isExpanded
              //                 ? AppLocalizations.of(context)!.seeLess
              //                 : AppLocalizations.of(context)!.seeMore,
              //             style: AppTextStyle.bold16.copyWith(
              //               color: AppColors.white,
              //             ),
              //           ),
              //         )
              //       : const Offstage(),
              // )
            ],
          ),
        ],
      ),
    );
  }
  //   loading: () {
  //     return GridView.builder(
  //       primary: false,
  //       shrinkWrap: true,
  //       physics: const NeverScrollableScrollPhysics(),
  //       padding: const EdgeInsets.all(20).copyWith(bottom: 50),
  //       gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //         crossAxisCount: 3,
  //         mainAxisSpacing: 10.0,
  //         crossAxisSpacing: 10.0,
  //         mainAxisExtent: 110,
  //       ),
  //       itemCount: 6,
  //       itemBuilder: (BuildContext context, int index) {
  //         return Container(
  //           decoration: BoxDecoration(
  //             color: AppColors.lighterBlue,
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //         );
  //       },
  //     );
  //   },
  //   error: (error, stack) {
  //     return const Offstage();
  //   },
  // );
}

double _getExtendedHeight(int itemCount) {
  double itemHeight = 110.0;
  double spacing = 10.0;

  int rowCount = (itemCount / 3).ceil();
  double totalHeight = (rowCount * itemHeight + (rowCount - 1) * spacing) + 50;

  return totalHeight;
}

class _VendorGrideViewBuilder extends ConsumerWidget {
  const _VendorGrideViewBuilder({
    required this.vendors,
  });
  final List<VendorEntity> vendors;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
      itemCount: vendors.length,
      primary: false,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        mainAxisSpacing: 10.0,
        crossAxisSpacing: 10.0,
        mainAxisExtent: 110,
      ),
      padding: const EdgeInsets.only(
        bottom: 50,
      ),
      itemBuilder: (context, index) {
        final vendor = vendors[index];

        return VendorCard(
          vendor: vendor,
        );
      },
    );
  }
}
