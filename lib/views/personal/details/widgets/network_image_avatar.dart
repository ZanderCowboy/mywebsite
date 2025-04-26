import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: Colors.transparent,
        child: ClipOval(
          child: Image.network(
            imageUrl,
            fit: BoxFit.contain,
            width: width,
            height: height,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) return child;
              return CircleAvatar(
                radius: radius,
                backgroundColor: Colors.grey[200],
                child: CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                          loadingProgress.expectedTotalBytes!
                      : null,
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              );
            },
            errorBuilder: (_, __, ___) {
              return CircleAvatar(
                radius: radius,
                backgroundImage: AssetImage(Assets.images.placeholder.path),
                backgroundColor: Colors.grey[200],
              );
            },
          ),
        ),
      ),
    );
  }
}
