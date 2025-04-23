import 'package:flutter/material.dart';

class TabBarHeader extends StatelessWidget {
  const TabBarHeader({
    required this.controller,
    required this.index,
    this.smallScreen = false,
    this.isScrollable = false,
    this.isSmallScreen = false,
    super.key,
  });

  final bool smallScreen;
  final TabController controller;
  final ValueNotifier<int> index;
  final bool isScrollable;
  final bool isSmallScreen;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: (value) {
        index.value = value;
      },
      isScrollable: isSmallScreen && isScrollable,
      textScaler: const TextScaler.linear(0.85),
      dividerColor: Colors.transparent,
      controller: controller,
      tabs: const [
        Tab(text: 'About Me'),
        Tab(text: 'Experience'),
        Tab(text: 'Projects'),
        Tab(text: 'Skills'),
        Tab(text: 'Education'),
      ],
      labelColor: Colors.white,
      labelPadding: const EdgeInsets.symmetric(horizontal: 6),
      unselectedLabelColor: Colors.grey,
      indicatorColor: isSmallScreen ? Colors.purple : Colors.white,
    );
  }
}
