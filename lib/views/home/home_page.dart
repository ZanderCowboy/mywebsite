import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/components/background_image.dart';
import 'package:mywebsite/components/copyright.dart';
import 'package:mywebsite/components/hero_widget.dart';
import 'package:mywebsite/components/link_button.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/gen/fonts.gen.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/models/enums/social_platform.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/constants.dart';
import 'package:mywebsite/util/ui_constants.dart';

part 'widgets/_buttons.dart';
part 'widgets/_footer.dart';
part 'widgets/_header.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();
    _analyticsService.logEvent(AnalyticsEvent.homePageView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _buildBackgroundImage(),
          const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _Header(),
                _Buttons(),
                _Footer(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    final backgroundImageUrl = globalAppImages?.backgroundImageUrl;
    final fallbackImagePath = Assets.images.homePageBackground.path;

    return BackgroundImage(
      imageUrl: backgroundImageUrl ?? fallbackImagePath,
      isPositioned: false,
      fallbackImage: Center(
        child: Image.asset(fallbackImagePath),
      ),
    );
  }
}
