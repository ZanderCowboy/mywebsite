import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/firebase_options.dart';
import 'package:mywebsite/models/domain/app_images.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/services/image_service.dart';
import 'package:mywebsite/services/remote_config_service.dart';

/// Global instance of loaded app images
/// This is populated during bootstrap and contains all image URLs
/// that are loaded from remote config or fallback to local assets
AppImages? globalAppImages;

/// Bootstrap the application by initializing all required services
/// This includes:
/// - Firebase initialization
/// - Remote config setup
/// - Image loading from remote config
/// - Analytics setup
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfigService = RemoteConfigService();
  await remoteConfigService.initialize();

  final imageService = ImageService();
  globalAppImages = await imageService.loadAppImages();

  final analyticsService = AnalyticsService();
  await analyticsService.trackAppOpen();

  await _setInitialUserProperties(analyticsService);
}

Future<void> _setInitialUserProperties(
  AnalyticsService analyticsService,
) async {
  try {
    final deviceType = _getDeviceType();

    await analyticsService.setUserProperties(
      userType: 'visitor',
      deviceType: deviceType,
      preferredTheme: 'dark',
      primaryLanguage: 'en',
    );
  } catch (e) {
    debugPrint('Error setting initial user properties: $e');
  }
}

/// Determine device type based on the platform
String _getDeviceType() {
  if (kIsWeb) {
    return 'web';
  }

  switch (defaultTargetPlatform) {
    case TargetPlatform.iOS:
    case TargetPlatform.android:
    case TargetPlatform.fuchsia:
      return 'mobile';
    case TargetPlatform.macOS:
    case TargetPlatform.windows:
    case TargetPlatform.linux:
      return 'desktop';
  }
}
