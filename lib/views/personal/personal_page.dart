import 'package:flutter/material.dart';
import 'package:mywebsite/bootstrap.dart';
import 'package:mywebsite/components/background_image.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/details.dart';
import 'package:mywebsite/views/personal/profile/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';

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
    // Log personal page view when the page is loaded
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

class _PersonalPageWeb extends StatelessWidget {
  const _PersonalPageWeb({required this.analyticsService});

  final AnalyticsService analyticsService;

  void _navigateToHome(BuildContext context) {
    analyticsService.logEvent(
      AnalyticsEvent.navigateToHome,
      parameters: {'source': 'personal_fab'},
    );
    Navigator.pushNamed(context, kHomePageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () => _navigateToHome(context),
        child: const Icon(Icons.arrow_back),
      ),
      body: const _PersonalPageBody(
        child: _WebContent(),
      ),
    );
  }
}

class _PersonalPageMobile extends StatelessWidget {
  const _PersonalPageMobile({required this.analyticsService});

  final AnalyticsService analyticsService;

  void _navigateToHome(BuildContext context) {
    analyticsService.logEvent(
      AnalyticsEvent.navigateToHome,
      parameters: {'source': 'personal_mobile_appbar'},
    );
    Navigator.pushNamed(context, kHomePageRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: _PersonalPageBody(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              floating: true,
              snap: true,
              backgroundColor: Colors.transparent.withValues(alpha: 0.5),
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => _navigateToHome(context),
              ),
              title: const Text(
                'Personal Details',
                style: TextStyle(color: Colors.white),
              ),
              centerTitle: true,
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: _MobileContent(),
              ),
            ),
          ],
        ),
      ),
    );
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
            fallbackAssetPath: Assets.images.homePageBackground.path,
          ),
        ] else ...[
          BackgroundImage(
            imageUrl: homePageBackgroundUrl,
            fallbackAssetPath: Assets.images.homePageBackground.path,
          ),
        ],
        child,
      ],
    );
  }
}

class _WebContent extends StatelessWidget {
  const _WebContent();

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kBackgroundColor,
      margin: allPadding24,
      child: Padding(
        padding: allPadding16,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 750;

            if (isSmall) {
              return const _SmallWebLayout();
            }

            return _LargeWebLayout(constraints: constraints);
          },
        ),
      ),
    );
  }
}

class _SmallWebLayout extends StatelessWidget {
  const _SmallWebLayout();

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Profile(),
          gap8,
          Details(isSmall: true),
        ],
      ),
    );
  }
}

class _LargeWebLayout extends StatelessWidget {
  const _LargeWebLayout({required this.constraints});

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: constraints.maxWidth < 1200 ? 2 : 1,
          child: SizedBox(
            height: context.screenHeight,
            child: const Profile(),
          ),
        ),
        gap8,
        const Flexible(
          flex: 3,
          child: Details(),
        ),
      ],
    );
  }
}

class _MobileContent extends StatelessWidget {
  const _MobileContent();

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Profile(),
        gap16,
        Details(isSmall: true),
      ],
    );
  }
}
