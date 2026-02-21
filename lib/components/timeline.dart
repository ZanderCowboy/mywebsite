import 'package:flutter/material.dart';
import 'package:mywebsite/util/color_constants.dart';

class Timeline extends StatelessWidget {
  const Timeline({
    required this.isFirst,
    required this.isLast,
    required this.height,
    this.timelineWidth = 40,
    this.cardHeight = 200,
    this.dotSize = 12,
    this.dotBackgroundColor = kBackButtonColor,
    this.lineWidth = 2,
    super.key,
  });

  final bool isFirst;
  final bool isLast;
  final double height;

  final double timelineWidth;
  final double cardHeight;
  final double dotSize;
  final Color dotBackgroundColor;
  final double lineWidth;

  @override
  Widget build(BuildContext context) {
    final dotCenterY = cardHeight / 2;

    return SizedBox(
      width: timelineWidth,
      height: height,
      child: CustomPaint(
        painter: _TimelinePainter(
          isFirst: isFirst,
          isLast: isLast,
          dotCenterY: dotCenterY,
          dotSize: dotSize,
          lineWidth: lineWidth,
        ),
        child: Align(
          alignment: Alignment(0, (dotCenterY - height / 2) / (height / 2)),
          child: Container(
            width: dotSize,
            height: dotSize,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: dotBackgroundColor,
            ),
          ),
        ),
      ),
    );
  }
}

class _TimelinePainter extends CustomPainter {
  _TimelinePainter({
    required this.isFirst,
    required this.isLast,
    required this.dotCenterY,
    required this.dotSize,
    required this.lineWidth,
  });

  final bool isFirst;
  final bool isLast;
  final double dotCenterY;
  final double dotSize;
  final double lineWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey[500]!
      ..strokeWidth = lineWidth
      ..style = PaintingStyle.fill;

    final centerX = size.width / 2;

    // Draw line above dot (if not first)
    // This line extends to the top to connect with the previous card's bottom line
    if (!isFirst) {
      const lineStartY = 0.0;
      final lineEndY = dotCenterY - dotSize / 2;
      canvas.drawLine(
        Offset(centerX, lineStartY),
        Offset(centerX, lineEndY),
        paint,
      );
    }

    // Draw line below dot (if not last)
    // This line extends to the bottom to connect with the next card's top line
    if (!isLast) {
      final lineStartY = dotCenterY + dotSize / 2;
      final lineEndY = size.height;
      canvas.drawLine(
        Offset(centerX, lineStartY),
        Offset(centerX, lineEndY),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(_TimelinePainter oldDelegate) {
    return oldDelegate.isFirst != isFirst ||
        oldDelegate.isLast != isLast ||
        oldDelegate.dotCenterY != dotCenterY;
  }
}
