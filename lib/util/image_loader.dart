import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';

/// Converts a Google Drive sharing URL to a direct image URL.
///
/// [sharingUrl]: The Google Drive sharing URL to convert.
/// Returns the direct image URL that can be used for loading images.
String convertGoogleDriveUrl(String sharingUrl) {
  // Regular expression to extract the file ID from the sharing URL
  final regExp = RegExp('/d/([a-zA-Z0-9_-]+)');
  final Match? match = regExp.firstMatch(sharingUrl);

  if (match != null && match.groupCount >= 1) {
    final fileId = match.group(1)!; // Extract the file ID
    return 'https://lh3.googleusercontent.com/d/$fileId'; // Return the direct image URL
  } else {
    throw ArgumentError('Invalid Google Drive sharing URL');
  }
}

/// Processes an image URL, converting Google Drive URLs if necessary.
///
/// [imageUrl]: The original image URL.
/// Returns the processed URL ready for image loading.
String processImageUrl(String imageUrl) {
  // Check if the URL is a Google Drive sharing URL
  if (imageUrl.contains('drive.google.com') && imageUrl.contains('/d/')) {
    try {
      return convertGoogleDriveUrl(imageUrl);
    } catch (e) {
      // If conversion fails, return the original URL
      return imageUrl;
    }
  }
  return imageUrl;
}

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
    // Process the URL to convert Google Drive URLs if necessary
    final processedUrl = processImageUrl(imageUrl);

    if (processedUrl.toLowerCase().endsWith('.svg')) {
      return SvgPicture.network(
        processedUrl,
        placeholderBuilder: (context) => placeholder,
        height: height,
        fit: fit,
        width: width ?? double.infinity,
      );
    } else {
      // Use disk-backed cache to avoid 429 rate limits during development.
      // Cached images persist across app restarts (default ~7 days).
      return CachedNetworkImage(
        imageUrl: processedUrl,
        fit: fit,
        height: height,
        width: width ?? double.infinity,
        placeholder: (_, __) => placeholder,
        errorWidget: (_, __, ___) => errorWidget,
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
