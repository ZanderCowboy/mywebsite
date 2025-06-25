import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/firebase_options.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/views/home/home_page.dart';
import 'package:mywebsite/views/personal/personal_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Track app opening and first visit
  final analyticsService = AnalyticsService();
  await analyticsService.trackAppOpen();

  // Set initial user properties
  await _setInitialUserProperties(analyticsService);

  runApp(const App());
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

class App extends StatelessWidget {
  const App({
    super.key,
  });

  // Create an AnalyticsService instance
  static final AnalyticsService analyticsService = AnalyticsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        // Update device type based on screen size for web users
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateDeviceTypeBasedOnScreenSize(context);
        });

        return ResponsiveBreakpoints.builder(
          child: child!,
          breakpoints: [
            const Breakpoint(start: 0, end: 480, name: MOBILE),
            const Breakpoint(start: 481, end: 1000, name: TABLET),
            const Breakpoint(start: 1001, end: 1500, name: DESKTOP),
            const Breakpoint(start: 1501, end: double.infinity, name: '4K'),
          ],
        );
      },
      title: 'Zander Kotze Website',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      initialRoute: kHomePageRoute,
      routes: {
        kHomePageRoute: (_) => const HomePage(),
        kPersonalPageRoute: (_) => const PersonalPage(),
      },
      navigatorObservers: <NavigatorObserver>[analyticsService.observer],
    );
  }

  /// Update device type user property based on screen size (useful for web)
  void _updateDeviceTypeBasedOnScreenSize(BuildContext context) {
    if (kIsWeb) {
      final screenWidth = MediaQuery.of(context).size.width;
      String deviceType;

      if (screenWidth <= 480) {
        deviceType = 'mobile';
      } else if (screenWidth <= 1000) {
        deviceType = 'tablet';
      } else {
        deviceType = 'desktop';
      }

      // Update user properties with screen-size-based device type
      analyticsService.setUserProperties(deviceType: deviceType);
    }
  }
}
