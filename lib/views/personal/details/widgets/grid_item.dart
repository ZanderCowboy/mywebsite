import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';
import 'package:shimmer/shimmer.dart';

class GridItem extends StatelessWidget {
  const GridItem({
    required this.icon,
    required this.title,
    this.iconStyle = const IconStyle(Colors.white, 40),
    this.subtitle = '',
    this.shimmer = false,
    super.key,
  });

  final IconData icon;
  final IconStyle iconStyle;
  final String title;
  final String subtitle;
  final bool shimmer;

  @override
  Widget build(BuildContext context) {
    final card = AnimatedContainer(
      duration: const Duration(milliseconds: 400),
      constraints: const BoxConstraints(
        minWidth: 220,
      ),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0A2540)
                .withValues(alpha: 0.5), // deep blue shadow
            blurRadius: 12,
            offset: const Offset(0, 6),
            blurStyle: BlurStyle.outer,
          ),
        ],
        color: const Color(0xFF2A2A2A),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Material(
            color: Colors.transparent,
            elevation: 6,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                color: iconStyle.color,
                size: iconStyle.size,
              ),
            ),
          ),
          gap16,
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Typo.title,
                  softWrap: true,
                  overflow: TextOverflow.visible,
                ),
                gap8,
                Flexible(
                  child: Text(
                    subtitle,
                    style: Typo.subtitle,
                    softWrap: true,
                    overflow: TextOverflow.visible,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );

    if (shimmer) {
      return Shimmer.fromColors(
        baseColor: const Color(0xFF2A2A2A),
        highlightColor: const Color(0xFF3A506B),
        child: card,
      );
    } else {
      return _AnimatedGradientBorder(child: card);
    }
  }
}

class IconStyle {
  const IconStyle(this.color, this.size);

  final Color color;
  final double size;
}

class _AnimatedGradientBorder extends StatefulWidget {
  const _AnimatedGradientBorder({required this.child});

  final Widget child;

  @override
  State<_AnimatedGradientBorder> createState() =>
      _AnimatedGradientBorderState();
}

class _AnimatedGradientBorderState extends State<_AnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              width: 3,
              color: Colors.transparent,
            ),
            gradient: SweepGradient(
              colors: const [
                Color(0xFF3A506B),
                Color(0xFF5BC0BE),
                Color(0xFF1C2541),
                Color(0xFF3A506B),
              ],
              stops: const [0.0, 0.5, 0.8, 1.0],
              transform: GradientRotation(_controller.value * 6.28),
            ),
          ),
          child: Container(
            margin: const EdgeInsets.all(3),
            decoration: BoxDecoration(
              color: const Color(0xFF2A2A2A),
              borderRadius: BorderRadius.circular(15),
            ),
            child: widget.child,
          ),
        );
      },
    );
  }
}
