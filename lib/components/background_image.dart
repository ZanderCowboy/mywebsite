import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

/// A shared background image widget that can be used across different pages.
///
/// This widget handles loading background images from network URLs with fallback
/// to local assets, and provides consistent error handling and loading states.
class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    required this.imageUrl,
    required this.fallbackImage,
    super.key,
    this.fit = BoxFit.cover,
    this.isPositioned = true,
  });

  /// The network URL for the background image
  final String imageUrl;

  /// The fallback image [Widget] to use as fallback
  final Widget fallbackImage;

  /// How the image should be fitted within its bounds
  final BoxFit fit;

  /// Whether to wrap the image in a Positioned.fill widget
  final bool isPositioned;

  @override
  Widget build(BuildContext context) {
    final imageWidget = FadeInImage.memoryNetwork(
      fit: fit,
      placeholder: kTransparentImage,
      image: imageUrl,
      imageErrorBuilder: (_, __, ___) {
        return fallbackImage;
      },
    );

    if (isPositioned) {
      return Positioned.fill(child: imageWidget);
    }

    return imageWidget;
  }
}
