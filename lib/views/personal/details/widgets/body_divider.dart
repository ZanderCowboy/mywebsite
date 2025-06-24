import 'package:flutter/material.dart';

class BodyDivider extends StatelessWidget {
  const BodyDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 80,
      child: Divider(
        thickness: 4,
        indent: 0,
        endIndent: 0,
        height: 24,
        color: Colors.purple,
      ),
    );
  }
}
