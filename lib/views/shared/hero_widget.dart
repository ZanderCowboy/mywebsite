import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';

class HeroWidget extends StatelessWidget {
  const HeroWidget({super.key});

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
            child: Image.asset(
              Assets.images.profile.profile2Png.path,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
        );
      },
      tag: 'profile',
      child: Padding(
        padding: allPadding4,
        child: Image.asset(
          Assets.images.profile.profile2Png.path,
          height: 250,
        ),
      ),
    );
  }
}
