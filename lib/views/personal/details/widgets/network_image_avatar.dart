import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/image_loader.dart';

class NetworkImageAvatar extends StatelessWidget {
  const NetworkImageAvatar({
    required this.imageUrl,
    this.onTap,
    this.radius = 20,
    this.width = 45,
    this.height = 45,
    this.timeoutDuration = const Duration(seconds: 10),
    this.isCircular = true,
    super.key,
  });

  final String imageUrl;
  final VoidCallback? onTap;
  final double radius;
  final double width;
  final double height;
  final Duration timeoutDuration;
  final bool isCircular;

  bool get _isSvg => imageUrl.toLowerCase().endsWith('.svg');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: _isSvg ? _buildSvgAvatar() : _buildImageAvatar(),
    );
  }

  Widget _buildSvgAvatar() {
    return FutureBuilder<Widget>(
      future: Future.value(
        loadImageWidget(
          imageUrl: imageUrl,
          isNetworkImage: true,
          height: height,
          width: width,
        ),
      ).timeout(timeoutDuration),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return _buildErrorWidget();
        }

        return _buildImageContainer(snapshot.data!);
      },
    );
  }

  Widget _buildImageAvatar() {
    return FutureBuilder<ImageProvider>(
      future: _loadImage().timeout(timeoutDuration),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingWidget();
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return _buildErrorWidget();
        }

        return _buildImageContainer(
          Image(image: snapshot.data!),
        );
      },
    );
  }

  Widget _buildLoadingWidget() {
    if (isCircular) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[200],
        child: const CircularProgressIndicator(
          color: Colors.white,
          strokeWidth: 2,
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Center(
          child: CircularProgressIndicator(
            color: Colors.white,
            strokeWidth: 2,
          ),
        ),
      );
    }
  }

  Widget _buildErrorWidget() {
    if (isCircular) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: AssetImage(Assets.images.placeholder.path),
        backgroundColor: Colors.grey[200],
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.asset(
            Assets.images.placeholder.path,
            fit: BoxFit.cover,
          ),
        ),
      );
    }
  }

  Widget _buildImageContainer(Widget imageWidget) {
    if (isCircular) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.grey[200],
        child: ClipOval(
          child: imageWidget,
        ),
      );
    } else {
      return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(8),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: imageWidget,
        ),
      );
    }
  }

  Future<ImageProvider> _loadImage() async {
    try {
      // Process the URL to convert Google Drive URLs if necessary
      final processedUrl = processImageUrl(imageUrl);
      final image = NetworkImage(processedUrl)
        ..resolve(ImageConfiguration.empty);
      return image;
    } catch (e) {
      // Return placeholder image provider if network image fails
      return AssetImage(Assets.images.placeholder.path);
    }
  }
}
