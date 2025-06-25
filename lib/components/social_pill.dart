import 'package:flutter/material.dart';
import 'package:mywebsite/util/export.dart';

class SocialPill extends StatelessWidget {
  const SocialPill({
    required this.iconWidget,
    required this.label,
    this.onTap,
    super.key,
  });

  final Widget iconWidget;
  final String label;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: borderRadius30,
      child: Container(
        padding: horizontal16 + vertical8,
        decoration: BoxDecoration(
          color:
              Theme.of(context).colorScheme.secondary.withValues(alpha: 0.15),
          borderRadius: borderRadius30,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            iconWidget,
            gap8,
            Text(
              label,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
