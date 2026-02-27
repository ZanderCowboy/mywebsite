import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/components/background_image.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/details.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';
import 'package:mywebsite/views/personal/profile/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';

part '_personal_page_mobile.dart';
part '_personal_page_web.dart';

class PersonalPage extends StatefulWidget {
  const PersonalPage({super.key});

  @override
  State<PersonalPage> createState() => _PersonalPageState();
}

class _PersonalPageState extends State<PersonalPage> {
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();
    _analyticsService.logEvent(AnalyticsEvent.personalPageView);
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveBreakpoints.of(context).isMobile;
    return isMobile
        ? _PersonalPageMobile(analyticsService: _analyticsService)
        : _PersonalPageWeb(analyticsService: _analyticsService);
  }
}

class _PersonalPageBody extends StatelessWidget {
  const _PersonalPageBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final backgroundImageUrl = globalAppImages?.backgroundImageUrl;

    return Stack(
      fit: StackFit.expand,
      children: [
        if (backgroundImageUrl != null && backgroundImageUrl.isNotEmpty) ...[
          BackgroundImage(
            imageUrl: backgroundImageUrl,
            fallbackImage: Center(
              child: Image.asset(Assets.images.homePageBackground.path),
            ),
          ),
        ] else ...[
          BackgroundImage(
            imageUrl: homePageBackgroundUrl,
            fallbackImage: Center(
              child: Image.asset(Assets.images.homePageBackground.path),
            ),
          ),
        ],
        child,
      ],
    );
  }
}
