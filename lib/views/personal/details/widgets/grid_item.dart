import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    required this.icon,
    required this.title,
    this.iconStyle = const IconStyle(Colors.white, 48),
    this.subtitle = '',
    super.key,
  });

  final IconData icon;
  final IconStyle iconStyle;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        minHeight: 500,
        minWidth: 500,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          const BoxShadow(
            color: Colors.purple,
            blurRadius: 4,
            offset: Offset(-1, -1),
            blurStyle: BlurStyle.solid,
          ),
          BoxShadow(
            color: Colors.white.withValues(alpha: 0.30),
            blurRadius: 4,
            offset: const Offset(-1, -1),
            blurStyle: BlurStyle.outer,
          ),
        ],
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(12),
      ),
      alignment: Alignment.center,
      child: Row(
        children: [
          gap24,
          Icon(
            icon,
            color: iconStyle.color,
            size: iconStyle.size,
          ),
          gap8,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Typo.title,
              ),
              gap8,
              Text(
                subtitle,
                style: Typo.subtitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class IconStyle {
  const IconStyle(this.color, this.size);

  final Color color;
  final double size;
}
