import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/util/export.dart';

enum SocialPlatform {
  github(
    name: 'GitHub',
    url: githubURL,
    color: githubColor,
  ),
  linkedin(
    name: 'LinkedIn',
    url: linkedInURL,
    color: linkedInColor,
  ),
  twitter(
    name: 'Twitter',
    url: xURL,
    color: xColor,
  ),
  x(
    name: 'X',
    url: xURL,
    color: xColor,
  ),
  instagram(
    name: 'Instagram',
    url: instagramURL,
    color: instagramColor,
  ),
  youtube(
    name: 'YouTube',
    url: youtubeURL,
    color: youtubeColor,
  ),
  discord(
    name: 'Discord',
    url: discordURL,
    color: discordColor,
  );

  const SocialPlatform({
    required this.name,
    required this.url,
    required this.color,
  });

  final String name;
  final String url;
  final Color color;

  String get assetPath {
    switch (this) {
      case SocialPlatform.github:
        return Assets.images.home.github.path;
      case SocialPlatform.linkedin:
        return Assets.images.home.linkedin.path;
      case SocialPlatform.twitter:
      case SocialPlatform.x:
        return Assets.images.home.xLogo.path;
      case SocialPlatform.instagram:
        return Assets.images.home.instagram.path;
      case SocialPlatform.youtube:
        return Assets.images.home.youtube.path;
      case SocialPlatform.discord:
        return Assets.images.home.discord.path;
    }
  }

  static SocialPlatform? fromString(String platform) {
    for (final socialPlatform in SocialPlatform.values) {
      if (socialPlatform.name.toLowerCase() == platform.toLowerCase()) {
        return socialPlatform;
      }
    }
    return null;
  }
}
