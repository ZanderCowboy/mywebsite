part of 'details.dart';

class _DetailsTabLayout extends HookWidget {
  const _DetailsTabLayout({
    required this.isSmall,
    required this.flags,
  });

  final bool isSmall;
  final Map<RemoteConfigFeatureFlags, bool> flags;

  @override
  Widget build(BuildContext context) {
    final index = useState(0);
    final controller = useTabController(
      initialLength: _sectionCount,
      initialIndex: index.value,
    );

    final tabBarHeader = TabBarHeader(
      controller: controller,
      onTap: (value) => index.value = value,
      isScrollable: !isSmall,
      isSmallScreen: isSmall,
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
                    child:
                        _getBody(index: index.value, constraints: constraints),
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
          showHeader: !isSmall,
          showQuote: flags[RemoteConfigFeatureFlags.aboutMeShowQuote] ?? false,
          useSplit: flags[RemoteConfigFeatureFlags.aboutMeUseSplit] ?? false,
        ),
      1 => Experiences(
          showHeader: !isSmall,
          useParagraphs:
              flags[RemoteConfigFeatureFlags.experienceUseParagraphs] ?? false,
        ),
      2 => Projects(showHeader: !isSmall),
      3 => Skills(showHeader: !isSmall),
      4 => Educations(
          showHeader: !isSmall,
          useSplit: flags[RemoteConfigFeatureFlags.educationUseSplit] ?? false,
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
