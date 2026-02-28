// ignore_for_file: omit_local_variable_types

part of 'personal_page.dart';

const _sectionCount = 6;

class _PersonalPageMobile extends StatefulWidget {
  const _PersonalPageMobile({
    required this.analyticsService,
    required this.onNavigateToHome,
  });

  final AnalyticsService analyticsService;
  final VoidCallback onNavigateToHome;

  @override
  State<_PersonalPageMobile> createState() => _PersonalPageMobileState();
}

class _PersonalPageMobileState extends State<_PersonalPageMobile>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  late final List<GlobalKey> _sectionKeys;
  late final TabController _tabController;
  int _currentIndex = 0;
  bool _isScrollingProgrammatically = false;

  @override
  void initState() {
    super.initState();
    _sectionKeys = List.generate(_sectionCount, (_) => GlobalKey());
    _tabController = TabController(
      length: _sectionCount,
      initialIndex: _currentIndex,
      vsync: this,
    );
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    widget.analyticsService.logEvent(
      AnalyticsEvent.navigateToHome,
      parameters: Parameters(source: 'personal_mobile_appbar'),
    );
    widget.onNavigateToHome();
  }

  void _scrollListener() {
    // Skip if we're scrolling programmatically
    if (_isScrollingProgrammatically) return;

    // Threshold: when a section's top is at this position or above, it's considered active
    // This accounts for the pinned header (toolbarExpandedHeight 56 + bottomHeight 50 = 106)
    const double toolbarExpandedHeight = 56;
    const double bottomHeight = 50;
    final mediaQuery = MediaQuery.of(context);
    final double activationThreshold =
        toolbarExpandedHeight + bottomHeight + mediaQuery.padding.top;
    var newIndex = 0;

    for (var i = 0; i < _sectionCount; i++) {
      final sectionContext = _sectionKeys[i].currentContext;
      if (sectionContext == null) continue;

      final sectionBox = sectionContext.findRenderObject() as RenderBox?;
      if (sectionBox == null) continue;

      final sectionPosition = sectionBox.localToGlobal(Offset.zero);

      // If section top is at or above the threshold, it's the active section
      if (sectionPosition.dy <= activationThreshold) {
        newIndex = i;
      }
    }

    if (_currentIndex != newIndex) {
      setState(() {
        _currentIndex = newIndex;
        _tabController.index = newIndex;
      });

      // Log section view analytics
      final sectionName = _getSectionName(newIndex);
      widget.analyticsService.logEvent(
        AnalyticsEvent.personalSectionView,
        parameters: Parameters(
          tabName: sectionName,
          section: 'personal_page_mobile',
          itemType: 'scroll_section',
        ),
      );
    }
  }

  void _scrollToSection(int index) {
    setState(() {
      _currentIndex = index;
      _tabController.index = index;
      _isScrollingProgrammatically = true;
    });

    final key = _sectionKeys[index];
    final keyContext = key.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      ).then((_) {
        // Re-enable scroll listener after animation completes
        if (!mounted) return;
        setState(() => _isScrollingProgrammatically = false);
      });
    } else {
      // If context is null, re-enable immediately
      if (!mounted) return;
      setState(() => _isScrollingProgrammatically = false);
    }

    // Log navigation click analytics
    final sectionName = _getSectionName(index);
    widget.analyticsService.logEvent(
      AnalyticsEvent.personalTabChange,
      parameters: Parameters(
        tabName: sectionName,
        section: 'personal_page_mobile',
        itemType: 'section_nav_click',
      ),
    );
  }

  String _getSectionName(int index) {
    return switch (index) {
      0 => 'Profile',
      1 => 'About Me',
      2 => 'Experience',
      3 => 'Projects',
      4 => 'Skills',
      5 => 'Education',
      _ => 'Unknown',
    };
  }

  @override
  Widget build(BuildContext context) {
    const double toolbarExpandedHeight = 56;
    final flags = AllData.instance.featureFlags;
    final bool useV2Layout =
        flags[RemoteConfigFeatureFlags.useV2Layout] ?? true;
    final double bottomHeight = useV2Layout ? 50.0 : 0;

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverPersistentHeader(
            pinned: true,
            delegate: _PersonalMobileAppBarDelegate(
              bottomHeight: bottomHeight,
              toolbarExpandedHeight: toolbarExpandedHeight,
              onBackTap: _navigateToHome,
              currentIndex: _currentIndex,
              tabController: _tabController,
              onSectionTap: _scrollToSection,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: _MobileContent(sectionKeys: _sectionKeys),
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileContent extends StatelessWidget {
  const _MobileContent({required this.sectionKeys});

  final List<GlobalKey> sectionKeys;

  @override
  Widget build(BuildContext context) {
    final flags = AllData.instance.featureFlags;

    return LayoutBuilder(
      builder: (context, constraints) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          KeyedSubtree(
            key: sectionKeys[0],
            child: const Profile(),
          ),
          gap16,
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius12,
            ),
            color: kPrimaryColor,
            child: Padding(
              padding: allPadding24,
              child: KeyedSubtree(
                key: sectionKeys[1],
                child: AboutMe(
                  flags: flags,
                  wrapInScrollView: false,
                ),
              ),
            ),
          ),
          gap12,
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius12,
            ),
            color: kPrimaryColor,
            child: Padding(
              padding: allPadding24,
              child: KeyedSubtree(
                key: sectionKeys[2],
                child: Experiences(
                  flags: flags,
                  wrapInScrollView: false,
                ),
              ),
            ),
          ),
          gap12,
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius12,
            ),
            color: kPrimaryColor,
            child: Padding(
              padding: allPadding24,
              child: KeyedSubtree(
                key: sectionKeys[3],
                child: const Projects(
                  wrapInScrollView: false,
                ),
              ),
            ),
          ),
          gap12,
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius12,
            ),
            color: kPrimaryColor,
            child: Padding(
              padding: allPadding24,
              child: KeyedSubtree(
                key: sectionKeys[4],
                child: const Skills(
                  wrapInScrollView: false,
                ),
              ),
            ),
          ),
          gap12,
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius12,
            ),
            color: kPrimaryColor,
            child: Padding(
              padding: allPadding24,
              child: KeyedSubtree(
                key: sectionKeys[5],
                child: Educations(
                  flags: flags,
                  wrapInScrollView: false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PersonalMobileAppBarDelegate extends SliverPersistentHeaderDelegate {
  _PersonalMobileAppBarDelegate({
    required this.bottomHeight,
    required this.toolbarExpandedHeight,
    required this.onBackTap,
    required this.currentIndex,
    required this.tabController,
    required this.onSectionTap,
  });

  final double bottomHeight;
  final double toolbarExpandedHeight;
  final VoidCallback onBackTap;
  final int currentIndex;
  final TabController tabController;
  final void Function(int) onSectionTap;

  @override
  double get minExtent => bottomHeight;

  @override
  double get maxExtent => bottomHeight + toolbarExpandedHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final t = (1 - (shrinkOffset / toolbarExpandedHeight)).clamp(0.0, 1.0);

    return ColoredBox(
      color: Colors.transparent.withValues(alpha: 0.9),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          if (toolbarExpandedHeight > 0)
            SizedBox(
              height: toolbarExpandedHeight * t,
              child: Opacity(
                opacity: t,
                child: Transform.translate(
                  offset: Offset(0, (1 - t) * -8),
                  child: SafeArea(
                    bottom: false,
                    child: AppBar(
                      leading: IconButton(
                        icon: const Icon(Icons.arrow_back),
                        color: kBackButtonColor,
                        onPressed: onBackTap,
                      ),
                      title: const Text(
                        'Personal Details',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                        ),
                      ),
                      centerTitle: true,
                      backgroundColor:
                          Colors.transparent.withValues(alpha: 0.9),
                      foregroundColor: Colors.transparent,
                    ),
                  ),
                ),
              ),
            ),
          if (bottomHeight > 0)
            Padding(
              padding: const EdgeInsets.all(4),
              child: SizedBox(
                height: bottomHeight - 8,
                child: TabBarHeader(
                  controller: tabController,
                  onTap: onSectionTap,
                  tabLabels: const [
                    'Profile',
                    'About Me',
                    'Experience',
                    'Projects',
                    'Skills',
                    'Education',
                  ],
                  isScrollable: true,
                  isSmallScreen: true,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant _PersonalMobileAppBarDelegate oldDelegate) {
    return bottomHeight != oldDelegate.bottomHeight ||
        toolbarExpandedHeight != oldDelegate.toolbarExpandedHeight ||
        onBackTap != oldDelegate.onBackTap ||
        currentIndex != oldDelegate.currentIndex ||
        onSectionTap != oldDelegate.onSectionTap;
  }
}
