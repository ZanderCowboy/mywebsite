import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/views/root_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

class App extends StatelessWidget {
  const App({
    super.key,
  });

  static final AnalyticsService analyticsService = AnalyticsService();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateDeviceTypeBasedOnScreenSize(context);
          _updateDeviceTheme(context);
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
      title: 'Zander Kotze',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const RootPage(),
      navigatorObservers: <NavigatorObserver>[analyticsService.observer],
    );
  }

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

      analyticsService.setUserProperties(deviceType: deviceType);
    }
  }

  void _updateDeviceTheme(BuildContext context) {
    final platformBrightness = MediaQuery.of(context).platformBrightness;
    String theme;

    if (platformBrightness == Brightness.light) {
      theme = 'light';
    } else {
      theme = 'dark';
    }

    analyticsService.setUserProperties(preferredTheme: theme);
  }
}
