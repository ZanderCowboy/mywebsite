import 'package:flutter/material.dart';
import 'package:mywebsite/util/ui_constants.dart';

class SectionNavBar extends StatelessWidget {
  const SectionNavBar({
    required this.currentIndex,
    required this.onSectionTap,
    this.isSmallDeviceScreen = false,
    this.isSmallWidth = false,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onSectionTap;

  /// Returns [isSmallDeviceScreen] if it's a mobile or phone
  final bool isSmallDeviceScreen;

  /// Returns [isSmallWidth] if screen is small than threshold
  final bool isSmallWidth;

  static const _labels = [
    'About Me',
    'Experience',
    'Projects',
    'Skills',
    'Education',
  ];

  static const _mobileLabels = [
    'Profile',
    'About Me',
    'Experience',
    'Projects',
    'Skills',
    'Education',
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: List.generate(
        isSmallDeviceScreen ? _mobileLabels.length : _labels.length,
        (index) => GestureDetector(
          onTap: () => onSectionTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: horizontal10 + vertical8,
            decoration: BoxDecoration(
              color: index == currentIndex
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: borderRadius8,
            ),
            child: Text(
              isSmallDeviceScreen ? _mobileLabels[index] : _labels[index],
              style: TextStyle(
                color: index == currentIndex ? Colors.white : Colors.grey,
                fontWeight:
                    index == currentIndex ? FontWeight.w600 : FontWeight.normal,
                fontSize: isSmallDeviceScreen
                    ? 11
                    : isSmallWidth
                        ? 12
                        : 15,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
