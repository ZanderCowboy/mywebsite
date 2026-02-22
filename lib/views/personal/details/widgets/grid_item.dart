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
        color: const Color(0xFF2D3339),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
      child: Row(
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
      return RepaintBoundary(
        child: _HoverAnimatedGradientBorder(child: card),
      );
    }
  }
}

class IconStyle {
  const IconStyle(this.color, this.size);

  final Color color;
  final double size;
}

class _HoverAnimatedGradientBorder extends StatefulWidget {
  const _HoverAnimatedGradientBorder({required this.child});

  final Widget child;

  @override
  State<_HoverAnimatedGradientBorder> createState() =>
      _HoverAnimatedGradientBorderState();
}

class _HoverAnimatedGradientBorderState
    extends State<_HoverAnimatedGradientBorder>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  bool _hovered = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onEnter(PointerEvent _) {
    setState(() {
      _hovered = true;
      _controller.repeat();
    });
  }

  void _onExit(PointerEvent _) {
    setState(() {
      _hovered = false;
      _controller
        ..stop()
        ..reset();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: _onEnter,
      onExit: _onExit,
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(
                width: 2,
                color: _hovered
                    ? Colors.transparent
                    : const Color(0xFF3A506B).withValues(alpha: 0.5),
              ),
              gradient: _hovered
                  ? LinearGradient(
                      colors: const [
                        Color(0xFF3A506B),
                        Color(0xFF5BC0BE),
                        Color(0xFF1C2541),
                        Color(0xFF3A506B),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(
                        _controller.value * 2 * 3.14159,
                      ),
                    )
                  : null,
            ),
            child: Container(
              margin: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                color: const Color(0xFF2D3339),
                borderRadius: BorderRadius.circular(16),
              ),
              child: widget.child,
            ),
          );
        },
      ),
    );
  }
}
