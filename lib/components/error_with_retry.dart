import 'package:flutter/material.dart';
import 'package:mywebsite/util/color_constants.dart';
import 'package:mywebsite/util/typography.dart';
import 'package:mywebsite/util/ui_constants.dart';

class ErrorWithRetry extends StatelessWidget {
  const ErrorWithRetry({
    required this.errorMessage,
    required this.onPressed,
    super.key,
  });

  final String? errorMessage;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 48,
            color: Colors.grey[600],
          ),
          const SizedBox(height: 16),
          Text(
            'Failed to load experiences',
            style: Typo.body.copyWith(
              color: Colors.grey[600],
            ),
          ),
          gap16,
          ElevatedButton.icon(
            onPressed: onPressed,
            icon: const Icon(Icons.refresh),
            label: const Text('Retry'),
            style: ElevatedButton.styleFrom(
              backgroundColor: kPrimaryColor,
              foregroundColor: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
