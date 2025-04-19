import 'package:flutter/material.dart';
import 'package:mywebsite/services/app_info_service.dart';

class AppVersion extends StatelessWidget {
  const AppVersion({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: AppInfoService.getAppVersion(),
      builder: (context, snapshot) {
        return Tooltip(
          message: 'Version: ${snapshot.hasData ? snapshot.data : 'Unknown'}',
          child: child,
        );
      },
    );
  }
}
