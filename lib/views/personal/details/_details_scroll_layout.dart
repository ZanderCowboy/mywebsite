part of 'details.dart';

class _DetailsScrollLayout extends HookWidget {
  const _DetailsScrollLayout({
    required this.isSmall,
    required this.flags,
  });

  final bool isSmall;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  Widget build(BuildContext context) {
    final scrollController = useScrollController();
    final currentIndex = useState(0);
    final sectionKeys = useState(
      List.generate(_sectionCount, (_) => GlobalKey()),
    );
    final contentKey = useMemoized(GlobalKey.new, []);

    void scrollToSection(int index) {
      currentIndex.value = index;
      final key = sectionKeys.value[index];
      final keyContext = key.currentContext;
      if (keyContext != null) {
        Scrollable.ensureVisible(
          keyContext,
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeInOut,
        );
      }
    }

    useEffect(
      () {
        void listener() {
          final position = scrollController.position;
          final contentContext = contentKey.currentContext;
          if (contentContext == null) return;
          final contentBox = contentContext.findRenderObject() as RenderBox?;
          if (contentBox == null) return;

          final viewportCenter =
              position.pixels + position.viewportDimension / 2;
          var newIndex = 0;
          for (var i = 0; i < _sectionCount; i++) {
            final sectionContext = sectionKeys.value[i].currentContext;
            if (sectionContext == null) continue;
            final sectionBox = sectionContext.findRenderObject() as RenderBox?;
            if (sectionBox == null) continue;
            final sectionTop = contentBox
                .globalToLocal(sectionBox.localToGlobal(Offset.zero))
                .dy;
            if (sectionTop <= viewportCenter) {
              newIndex = i;
            }
          }
          if (currentIndex.value != newIndex) {
            currentIndex.value = newIndex;
          }
        }

        scrollController.addListener(listener);
        return () => scrollController.removeListener(listener);
      },
      [scrollController],
    );

    final sectionNavBar = SectionNavBar(
      currentIndex: currentIndex.value,
      onSectionTap: scrollToSection,
      isSmallScreen: isSmall,
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
                  controller: scrollController,
                  child: Column(
                    key: contentKey,
                    children: [
                      KeyedSubtree(
                        key: sectionKeys.value[0],
                        child: AboutMe(
                          flags: flags,
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: sectionKeys.value[1],
                        child: Experiences(
                          flags: flags,
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: sectionKeys.value[2],
                        child: const Projects(
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: sectionKeys.value[3],
                        child: const Skills(
                          wrapInScrollView: false,
                        ),
                      ),
                      gap24,
                      KeyedSubtree(
                        key: sectionKeys.value[4],
                        child: Educations(
                          flags: flags,
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
        borderRadius: isSmall
            ? const BorderRadius.only(
                topLeft: radius8,
                topRight: radius8,
              )
            : const BorderRadius.only(
                bottomLeft: radius8,
                topRight: radius8,
              ),
      ),
      constraints: isSmall
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

    return isSmall
        ? header
        : Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [header],
          );
  }
}
