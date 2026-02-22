import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/views/home/home_page.dart';
import 'package:mywebsite/views/personal/personal_page.dart';
import 'package:responsive_framework/responsive_framework.dart';

Future<void> main() async {
  await bootstrap();

  runApp(const App());
}

class App extends StatelessWidget {
  const App({
    super.key,
  });

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
