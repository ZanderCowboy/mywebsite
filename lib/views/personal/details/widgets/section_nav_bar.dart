import 'package:flutter/material.dart';

class SectionNavBar extends StatelessWidget {
  const SectionNavBar({
    required this.currentIndex,
    required this.onSectionTap,
    this.isSmallScreen = false,
    super.key,
  });

  final int currentIndex;
  final void Function(int) onSectionTap;
  final bool isSmallScreen;

  static const _labels = [
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
        _labels.length,
        (index) => GestureDetector(
          onTap: () => onSectionTap(index),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: index == currentIndex
                  ? Colors.white.withValues(alpha: 0.2)
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              _labels[index],
              style: TextStyle(
                color: index == currentIndex ? Colors.white : Colors.grey,
                fontWeight:
                    index == currentIndex ? FontWeight.w600 : FontWeight.normal,
                fontSize: isSmallScreen ? 12 : 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
