import 'package:flutter/material.dart';
import 'package:mywebsite/models/enums/star_level.dart';

class LevelToStars extends StatelessWidget {
  const LevelToStars({
    required this.level,
    super.key,
  });

  final StarLevel level;

  @override
  Widget build(BuildContext context) {
    final stars = level.value;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        5,
        (i) => Icon(
          i < stars ? Icons.star : Icons.star_border,
          size: 14,
          color: i < stars ? Colors.amber : Colors.grey,
        ),
      ),
    );
  }
}
