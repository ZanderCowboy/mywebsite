import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/analytics_event.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/parameters.dart';
import 'package:mywebsite/services/analytics_service.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/export.dart';
import 'package:mywebsite/views/personal/details/shared/export.dart';

part '_details_scroll_layout.dart';
part '_details_tab_layout.dart';

const _sectionCount = 5;

class Details extends StatefulWidget {
  const Details({
    this.isSmall = false,
    super.key,
  });

  final bool isSmall;

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    final flags = AllData.instance.featureFlags;
    final useV2Layout = flags[RemoteConfigFeatureFlags.useV2Layout] ?? true;

    if (useV2Layout) {
      return _DetailsScrollLayout(
        isSmall: widget.isSmall,
        flags: flags,
      );
    }

    return _DetailsTabLayout(
      isSmall: widget.isSmall,
      flags: flags,
    );
  }
}
