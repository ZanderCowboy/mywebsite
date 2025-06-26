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

  // Initialize Remote Config
  final remoteConfigService = RemoteConfigService();
  await remoteConfigService.initialize();

  // Load app images from remote config
  // This ensures images are ready before any UI is rendered
  final imageService = ImageService();
  globalAppImages = await imageService.loadAppImages();

  // Track app opening and first visit
  final analyticsService = AnalyticsService();
  await analyticsService.trackAppOpen();

  // Set initial user properties
  await _setInitialUserProperties(analyticsService);
}

/// Set initial user properties for analytics
Future<void> _setInitialUserProperties(
  AnalyticsService analyticsService,
) async {
  try {
    // Get device information
    final deviceType = _getDeviceType();

    await analyticsService.setUserProperties(
      userType: 'visitor', // Default user type for portfolio website
      deviceType: deviceType,
      preferredTheme: 'dark', // App uses dark theme
      primaryLanguage: 'en', // Portfolio is in English
    );
  } catch (e) {
    // Handle errors gracefully
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
      return 'mobile';
    case TargetPlatform.android:
      return 'mobile';
    case TargetPlatform.macOS:
      return 'desktop';
    case TargetPlatform.windows:
      return 'desktop';
    case TargetPlatform.linux:
      return 'desktop';
    case TargetPlatform.fuchsia:
      return 'mobile';
  }
}
