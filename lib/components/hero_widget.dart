import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/util/image_loader.dart';

class HeroWidget extends StatefulWidget {
  const HeroWidget({super.key});

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {
  @override
  Widget build(BuildContext context) {
    return Hero(
      flightShuttleBuilder: (
        flightContext,
        animation,
        flightDirection,
        fromHeroContext,
        toHeroContext,
      ) {
        return FadeTransition(
          opacity: animation,
          child: ClipOval(
            child: _buildProfileImage(height: 260, width: 260),
          ),
        );
      },
      tag: 'profile',
      child: Padding(
        padding: allPadding4,
        child: _buildProfileImage(height: 260, width: 260),
      ),
    );
  }

  Widget _buildProfileImage({double? height, double? width}) {
    final profileImageUrl = globalAppImages?.profileImageUrl;

    if (profileImageUrl != null && profileImageUrl.isNotEmpty) {
      return loadImageWidget(
        imageUrl: profileImageUrl,
        isNetworkImage: true,
        height: height ?? 250,
        width: width,
        placeholderAssetPath: Assets.images.profile.profile2Png.path,
      );
    } else {
      return Image.asset(
        Assets.images.profile.profile2Png.path,
        height: height,
        width: width,
        fit: BoxFit.cover,
      );
    }
  }
}
