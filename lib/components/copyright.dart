import 'package:flutter/material.dart';
import 'package:mywebsite/components/app_version.dart';
import 'package:mywebsite/util/export.dart';

class Copyright extends StatelessWidget {
  const Copyright({super.key});

  @override
  Widget build(BuildContext context) {
    return AppVersion(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${DateTime.now().year} ',
            style: Typo.body,
          ),
          const Icon(
            Icons.copyright,
            color: Colors.white,
            size: 20,
          ),
          const Text(
            ' Zander Kotze',
            style: Typo.body,
          ),
        ],
      ),
    );
  }
}
