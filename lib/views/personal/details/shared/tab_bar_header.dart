import 'package:flutter/material.dart';

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({
    required this.controller,
    required this.onTap,
    this.tabLabels = _defaultTabLabels,
    this.smallScreen = false,
    this.isScrollable = false,
    this.isSmallScreen = false,
    super.key,
  }) : assert(
          controller.length == tabLabels.length,
          'Controller length and tab label count needs to be equal',
        );

  static const _defaultTabLabels = [
    'About Me',
    'Experience',
    'Projects',
    'Skills',
    'Education',
  ];

  final bool smallScreen;
  final TabController controller;
  final void Function(int) onTap;
  final List<String> tabLabels;
  final bool isScrollable;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      isScrollable: isSmallScreen && isScrollable,
      textScaler: const TextScaler.linear(0.85),
      dividerColor: Colors.transparent,
      controller: controller,
      tabs: [
        for (final label in tabLabels) Tab(text: label),
      ],
      labelColor: Colors.white,
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      unselectedLabelColor: Colors.grey,
      indicatorColor: isSmallScreen ? Colors.purple : Colors.white,
    );
  }
}
