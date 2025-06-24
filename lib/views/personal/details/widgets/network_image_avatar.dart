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
    super.key,
  });

  final String imageUrl;
  final VoidCallback? onTap;
  final double radius;
  final double width;
  final double height;

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
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey[200],
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(Assets.images.placeholder.path),
            backgroundColor: Colors.grey[200],
          );
        }

        return CircleAvatar(
          radius: radius,
          backgroundColor: Colors.grey[200],
          child: ClipOval(
            child: snapshot.data,
          ),
        );
      },
    );
  }

  Widget _buildImageAvatar() {
    return FutureBuilder<ImageProvider>(
      future: _loadImage(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircleAvatar(
            radius: radius,
            backgroundColor: Colors.grey[200],
            child: const CircularProgressIndicator(
              color: Colors.white,
              strokeWidth: 2,
            ),
          );
        }

        if (snapshot.hasError || !snapshot.hasData) {
          return CircleAvatar(
            radius: radius,
            backgroundImage: AssetImage(Assets.images.placeholder.path),
            backgroundColor: Colors.grey[200],
          );
        }

        return CircleAvatar(
          radius: radius,
          backgroundImage: snapshot.data,
          backgroundColor: Colors.grey[200],
        );
      },
    );
  }

  Future<ImageProvider> _loadImage() async {
    try {
      final image = NetworkImage(imageUrl)..resolve(ImageConfiguration.empty);
      return image;
    } catch (e) {
      // Return placeholder image provider if network image fails
      return AssetImage(Assets.images.placeholder.path);
    }
  }
}
