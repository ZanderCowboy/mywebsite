import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

const kFirstIndex = 0;

class Details extends HookWidget {
  const Details({
    this.isSmall = false,
    super.key,
  });

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final index = useState(kFirstIndex);
    final controller = useTabController(
      initialLength: 5,
      initialIndex: index.value,
    );

    final tabBarHeader = TabBarHeader(
      controller: controller,
      onTap: (value) {
        index.value = value;
      },
      isScrollable: !isSmall,
      isSmallScreen: isSmall,
    );

    return DefaultTabController(
      length: 5,
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
                    child: _getBody(
                      index: index.value,
                      constraints: constraints,
                    ),
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
    final showHeader = !isSmall;

    return switch (index) {
      0 => AboutMe(showHeader: showHeader),
      1 => Experiences(showHeader: showHeader),
      2 => Projects(showHeader: showHeader),
      3 => Skills(showHeader: showHeader),
      4 => Educations(showHeader: showHeader),
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
