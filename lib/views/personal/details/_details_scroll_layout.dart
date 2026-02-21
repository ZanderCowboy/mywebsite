part of 'details.dart';

class _DetailsScrollLayout extends StatefulWidget {
  const _DetailsScrollLayout({
    required this.isSmall,
    required this.flags,
  });

  final bool isSmall;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  State<_DetailsScrollLayout> createState() => _DetailsScrollLayoutState();
}

class _DetailsScrollLayoutState extends State<_DetailsScrollLayout> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _contentKey = GlobalKey();
  late final List<GlobalKey> _sectionKeys;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _sectionKeys = List.generate(_sectionCount, (_) => GlobalKey());
    _scrollController.addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_scrollListener)
      ..dispose();
    super.dispose();
  }

  void _scrollListener() {
    final position = _scrollController.position;
    final contentContext = _contentKey.currentContext;
    if (contentContext == null) return;
    final contentBox = contentContext.findRenderObject() as RenderBox?;
    if (contentBox == null) return;

    final viewportCenter = position.pixels + position.viewportDimension / 2;
    var newIndex = 0;
    for (var i = 0; i < _sectionCount; i++) {
      final sectionContext = _sectionKeys[i].currentContext;
      if (sectionContext == null) continue;
      final sectionBox = sectionContext.findRenderObject() as RenderBox?;
      if (sectionBox == null) continue;
      final sectionTop =
          contentBox.globalToLocal(sectionBox.localToGlobal(Offset.zero)).dy;
      if (sectionTop <= viewportCenter) {
        newIndex = i;
      }
    }
    if (_currentIndex != newIndex) {
      setState(() => _currentIndex = newIndex);
    }
  }

  void _scrollToSection(int index) {
    setState(() => _currentIndex = index);
    final key = _sectionKeys[index];
    final keyContext = key.currentContext;
    if (keyContext != null) {
      Scrollable.ensureVisible(
        keyContext,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final sectionNavBar = SectionNavBar(
      currentIndex: _currentIndex,
      onSectionTap: _scrollToSection,
      isSmallScreen: widget.isSmall,
    );

    return LayoutBuilder(
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
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    key: _contentKey,
                    children: [
                      KeyedSubtree(
                        key: _sectionKeys[0],
                        child: AboutMe(
                          flags: widget.flags,
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: _sectionKeys[1],
                        child: Experiences(
                          flags: widget.flags,
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: _sectionKeys[2],
                        child: const Projects(
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: _sectionKeys[3],
                        child: const Skills(
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: _sectionKeys[4],
                        child: Educations(
                          flags: widget.flags,
                          wrapInScrollView: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            _getTabHeader(
              child: sectionNavBar,
              constraints: constraints,
            ),
          ],
        );
      },
    );
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
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
