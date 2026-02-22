part of 'details.dart';

class _DetailsTabLayout extends StatefulWidget {
  const _DetailsTabLayout({
    required this.isSmall,
    required this.flags,
  });

  final bool isSmall;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  State<_DetailsTabLayout> createState() => _DetailsTabLayoutState();
}

class _DetailsTabLayoutState extends State<_DetailsTabLayout>
    with SingleTickerProviderStateMixin {
  late final TabController _controller;
  int _index = 0;
  final AnalyticsService _analyticsService = AnalyticsService();

  @override
  void initState() {
    super.initState();
    _controller = TabController(
      length: _sectionCount,
      initialIndex: _index,
      vsync: this,
    );
    _controller.addListener(_handleTabChange);
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_handleTabChange)
      ..dispose();
    super.dispose();
  }

  void _handleTabChange() {
    if (_index == _controller.index) return;
    setState(() => _index = _controller.index);

    // Log tab change analytics
    final tabName = _getTabName(_controller.index);
    _analyticsService.logEvent(
      AnalyticsEvent.personalTabChange,
      parameters: Parameters(
        tabName: tabName,
        section: 'personal_page',
      ),
    );
  }

  String _getTabName(int index) {
    return switch (index) {
      0 => 'About Me',
      1 => 'Experience',
      2 => 'Projects',
      3 => 'Skills',
      4 => 'Education',
      _ => 'Unknown',
    };
  }

  @override
  Widget build(BuildContext context) {
    final tabBarHeader = TabBarHeader(
      controller: _controller,
      onTap: (value) => setState(() => _index = value),
      isScrollable: !widget.isSmall,
      isSmallScreen: widget.isSmall,
    );

    return DefaultTabController(
      length: _sectionCount,
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: borderRadius12,
                ),
                color: kPrimaryColor,
                child: Padding(
                  padding: allPadding24,
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: _getBody(index: _index, constraints: constraints),
                  ),
                ),
              ),
              _getTabHeader(
                child: tabBarHeader,
                constraints: constraints,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _getBody({
    required int index,
    required BoxConstraints constraints,
  }) {
    return switch (index) {
      0 => AboutMe(
          flags: widget.flags,
          showHeader: !widget.isSmall,
        ),
      1 => Experiences(
          flags: widget.flags,
          showHeader: !widget.isSmall,
        ),
      2 => Projects(showHeader: !widget.isSmall),
      3 => Skills(showHeader: !widget.isSmall),
      4 => Educations(
          flags: widget.flags,
          showHeader: !widget.isSmall,
        ),
      _ => const Text('No data available'),
    };
  }

  Widget _getTabHeader({
    required Widget child,
    required BoxConstraints constraints,
  }) {
    final header = Container(
      margin: allPadding4,
      decoration: BoxDecoration(
        color: kTernaryColor,
        borderRadius: widget.isSmall
            ? const BorderRadius.only(
                topLeft: radius8,
                topRight: radius8,
              )
            : const BorderRadius.only(
                bottomLeft: radius8,
                topRight: radius8,
              ),
      ),
      constraints: widget.isSmall
          ? const BoxConstraints(
              minHeight: 50,
            )
          : BoxConstraints(
              minHeight: 50,
              maxWidth: constraints.maxWidth * 0.70,
            ),
      child: child,
    );

    return widget.isSmall
        ? header
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [header],
          );
  }
}
