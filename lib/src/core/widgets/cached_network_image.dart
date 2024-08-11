import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:obhijuk/src/core/gen/assets.gen.dart';
import 'package:obhijuk/src/core/gen/colors.gen.dart';

class AppCachedNetworkImage extends StatelessWidget {
  const AppCachedNetworkImage({
    super.key,
    required this.image,
    this.showLoadingIndicator = false,
    this.placeholderImage = '',
    this.showLocalPlaceholder = false,
    this.fit = BoxFit.cover,
    this.width,
    this.height,
    this.errorWidget,
  });

  final String? image;
  final bool showLoadingIndicator;
  final String placeholderImage;
  final bool showLocalPlaceholder;
  final BoxFit fit;
  final double? width;
  final double? height;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final pxRatio = MediaQuery.of(context).devicePixelRatio;
        final cacheWidth = constraints.maxWidth * pxRatio;
        final cacheHeight = constraints.maxHeight * pxRatio;

        return CachedNetworkImage(
          imageUrl: image ?? placeholderImage,
          cacheKey: image ?? placeholderImage,
          fit: fit,
          width: width,
          height: height,
          memCacheHeight: int.tryParse(cacheHeight.toString()),
          memCacheWidth: int.tryParse(cacheWidth.toString()),
          maxWidthDiskCache: int.tryParse(cacheWidth.toString()),
          maxHeightDiskCache: int.tryParse(cacheHeight.toString()),
          errorWidget: (context, url, error) {
            if (errorWidget != null) {
              return errorWidget!;
            }

            if (showLocalPlaceholder) {
              return Image.asset(
                Assets.nextiveLogo.path,
                height: constraints.maxWidth * 0.5,
                width: constraints.maxWidth * 0.5,
              );
            }
            return CachedNetworkImage(
              imageUrl: placeholderImage,
              cacheKey: placeholderImage,
              fit: fit,
              memCacheHeight: cacheHeight.toInt(),
              memCacheWidth: cacheWidth.toInt(),
              maxWidthDiskCache: cacheWidth.toInt(),
              maxHeightDiskCache: cacheHeight.toInt(),
            );
          },
          progressIndicatorBuilder: showLoadingIndicator
              ? (context, url, progress) {
                  if (progress.progress != 0) {
                    return const FittedBox(
                      fit: BoxFit.cover,
                      child: CircularProgressIndicator(
                        color: AppColors.primary,
                      ),
                    );
                  }
                  return const Offstage();
                }
              : null,
        );
      },
    );
  }
}
