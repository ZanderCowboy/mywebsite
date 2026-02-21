import 'package:flutter/material.dart';

class BodyDivider extends StatelessWidget {
  const BodyDivider({
    this.color = Colors.purpleAccent,
    this.height = 24,
    this.width = 80,
    this.thickness = 4,
    super.key,
  });

  final double? width;
  final double? height;
  final double? thickness;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: Divider(
        thickness: thickness,
        indent: 0,
        endIndent: 0,
        height: height,
        color: color,
      ),
    );
  }
}
