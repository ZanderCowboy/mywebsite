import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';

/// Loads an image widget (network, SVG, or asset) with loading and error handling.
///
/// [imageUrl]: The URL or asset path of the image.
/// [isNetworkImage]: Whether the image is a network image.
/// [height], [width]: Optional dimensions for the image.
/// [fit]: How the image should be inscribed into the space allocated during layout.
Widget loadImageWidget({
  required String imageUrl,
  required bool isNetworkImage,
  double height = 200,
  double? width,
  BoxFit fit = BoxFit.cover,
  BorderRadius? borderRadius,
  String? placeholderAssetPath,
}) {
  final effectiveBorderRadius = borderRadius ?? borderRadius8;

  final placeholder = Container(
    height: height,
    width: width ?? double.infinity,
    decoration: BoxDecoration(
      borderRadius: effectiveBorderRadius,
      color: Colors.grey[200],
    ),
    child: const Center(
      child: CircularProgressIndicator(),
    ),
  );

  final errorWidget = Container(
    height: height,
    width: width ?? double.infinity,
    decoration: BoxDecoration(
      borderRadius: effectiveBorderRadius,
      image: DecorationImage(
        image:
            AssetImage(placeholderAssetPath ?? Assets.images.placeholder.path),
        fit: fit,
      ),
    ),
  );

  if (isNetworkImage) {
    if (imageUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        imageUrl,
        placeholderBuilder: (context) => placeholder,
        height: height,
        fit: fit,
        width: width ?? double.infinity,
      );
    } else {
      return Image.network(
        imageUrl,
        fit: fit,
        height: height,
        width: width ?? double.infinity,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return placeholder;
        },
        errorBuilder: (_, error, stackTrace) {
          return errorWidget;
        },
      );
    }
  } else {
    return Image.asset(
      imageUrl,
      fit: fit,
      height: height,
      width: width ?? double.infinity,
      errorBuilder: (_, __, ___) => errorWidget,
    );
  }
}
