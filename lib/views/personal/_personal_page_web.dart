part of 'personal_page.dart';

class _PersonalPageWeb extends StatelessWidget {
  const _PersonalPageWeb({
    required this.analyticsService,
    required this.onNavigateToHome,
  });

  final AnalyticsService analyticsService;
  final VoidCallback onNavigateToHome;

  void _navigateToHome() {
    analyticsService.logEvent(
      AnalyticsEvent.navigateToHome,
      parameters: Parameters(source: 'personal_fab'),
    );
    onNavigateToHome();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _PersonalPageBody(
            child: Card(
              color: kBackgroundColor,
              margin: allPadding24,
              child: Padding(
                padding: allPadding16,
                child: LayoutBuilder(
                  builder: (_, constraints) {
                    final isSmall = constraints.maxWidth < 600;

                    if (isSmall) {
                      return const _SmallWebLayout();
                    }

                    return _LargeWebLayout(constraints: constraints);
                  },
                ),
              ),
            ),
          ),
          Positioned(
            top: 16,
            left: 16,
            child: IconButton(
              onPressed: _navigateToHome,
              icon: const Icon(
                Icons.arrow_back,
                size: 28,
              ),
              color: kBackButtonColor,
              style: IconButton.styleFrom(
                backgroundColor: kTernaryColor.withValues(alpha: 0.8),
              ),
            ),
          ),
        ],
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
