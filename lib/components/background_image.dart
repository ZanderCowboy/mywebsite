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
    this.child,
    this.stackFit = StackFit.expand,
  });

  final String imageUrl;
  final Widget fallbackImage;
  final StackFit stackFit;
  final BoxFit fit;
  final bool isPositioned;
  final Widget? child;

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

    return Stack(
      fit: stackFit,
      children: [
        if (isPositioned) ...{
          Positioned.fill(
            child: imageWidget,
          ),
        } else ...{
          imageWidget,
        },
        child ?? const SizedBox.shrink(),
      ],
    );
  }
}
