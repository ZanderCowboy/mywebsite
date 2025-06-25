import 'package:flutter/material.dart';
import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/details.dart';
import 'package:mywebsite/views/personal/profile/profile.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:transparent_image/transparent_image.dart';

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
    if (isMobile) {
      return PersonalPageMobile(analyticsService: _analyticsService);
    } else {
      return PersonalPageWeb(analyticsService: _analyticsService);
    }
  }
}

class PersonalPageWeb extends StatelessWidget {
  const PersonalPageWeb({required this.analyticsService, super.key});

  final AnalyticsService analyticsService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.small(
        onPressed: () {
          analyticsService.logEvent(
            AnalyticsEvent.navigateToHome,
            parameters: {'source': 'personal_fab'},
          );
          Navigator.pushNamed(context, kHomePageRoute);
        },
        child: const Icon(
          Icons.arrow_back,
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: homePageBackgroundUrl,
              imageErrorBuilder: (_, __, ___) {
                return Center(
                  child: Image.asset(Assets.images.homePageBackground.path),
                );
              },
            ),
          ),
          Card(
            color: kBackgroundColor,
            margin: allPadding24,
            child: Padding(
              padding: allPadding16,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final isSmall = constraints.maxWidth < 750;

                  return isSmall
                      ? const SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Profile(),
                              gap8,
                              Details(isSmall: true),
                            ],
                          ),
                        )
                      : Row(
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
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PersonalPageMobile extends StatelessWidget {
  const PersonalPageMobile({required this.analyticsService, super.key});

  final AnalyticsService analyticsService;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: FadeInImage.memoryNetwork(
              fit: BoxFit.cover,
              placeholder: kTransparentImage,
              image: homePageBackgroundUrl,
              imageErrorBuilder: (_, __, ___) {
                return Center(
                  child: Image.asset(Assets.images.homePageBackground.path),
                );
              },
            ),
          ),
          CustomScrollView(
            slivers: [
              SliverAppBar(
                floating: true,
                snap: true,
                backgroundColor: Colors.transparent.withValues(alpha: 0.5),
                elevation: 0,
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    analyticsService.logEvent(
                      AnalyticsEvent.navigateToHome,
                      parameters: {'source': 'personal_mobile_appbar'},
                    );
                    Navigator.pushNamed(context, kHomePageRoute);
                  },
                ),
                title: const Text(
                  'Personal Details',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                centerTitle: true,
              ),
              const SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Profile(),
                      gap16,
                      Details(isSmall: true),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
