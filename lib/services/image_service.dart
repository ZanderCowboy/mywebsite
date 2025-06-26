import 'package:mywebsite/models/domain/app_images.dart';
import 'package:mywebsite/services/remote_config_service.dart';
import 'package:mywebsite/util/image_loader.dart';

/// Service responsible for loading and managing app images
class ImageService {
  factory ImageService() {
    return _instance;
  }

  ImageService._internal();
  static final ImageService _instance = ImageService._internal();

  final RemoteConfigService _remoteConfigService = RemoteConfigService();

  /// Loads all app images from remote config
  Future<AppImages> loadAppImages() async {
    try {
      final backgroundImageUrl =
          await _remoteConfigService.getBackgroundImageUrl();
      final profileImageUrl = await _remoteConfigService.getProfileImageUrl();

      return AppImages.withFallbacks(
        backgroundImageUrl:
            backgroundImageUrl != null && backgroundImageUrl.isNotEmpty
                ? processImageUrl(backgroundImageUrl)
                : null,
        profileImageUrl: profileImageUrl != null && profileImageUrl.isNotEmpty
            ? processImageUrl(profileImageUrl)
            : null,
      );
    } catch (e) {
      // Return empty AppImages if loading fails
      return AppImages.withFallbacks();
    }
  }
}
