import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

extension BuildContextExtension on BuildContext {
  /// Returns the width of the screen.
  double get screenWidth => MediaQuery.sizeOf(this).width;

  /// Returns the height of the screen.
  double get screenHeight => MediaQuery.sizeOf(this).height;

  /// Returns the size of the screen.
  Size get screenSize => MediaQuery.sizeOf(this);

  bool get isSmallScreen => screenWidth < 820;
  bool get isMediumScreen => screenWidth >= 820 && screenWidth < 1200;
  bool get isLargeScreen => screenWidth >= 1200;

  bool get isMobile => ResponsiveBreakpoints.of(this).isMobile;
  bool get isTablet => ResponsiveBreakpoints.of(this).isTablet;
  bool get isDesktop => ResponsiveBreakpoints.of(this).isDesktop;
}
