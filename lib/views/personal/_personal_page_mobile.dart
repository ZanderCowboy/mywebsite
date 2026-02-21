part of 'personal_page.dart';

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
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),
                  color: kBackButtonColor,
                  onPressed: () => _navigateToHome(context),
                ),
              ],
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
