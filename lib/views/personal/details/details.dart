import 'package:flutter/material.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

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
  late Future<Map<RemoteConfigFeatureFlags, bool>> _flagsFuture;

  @override
  void initState() {
    super.initState();
    _flagsFuture = AllData.featureFlags;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<RemoteConfigFeatureFlags, bool>>(
      future: _flagsFuture,
      builder: (context, snapshot) {
        final flags = snapshot.data ?? _defaultFlags();
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
      },
    );
  }
}

Map<RemoteConfigFeatureFlags, bool> _defaultFlags() {
  return {
    for (final f in RemoteConfigFeatureFlags.values) f: false,
  };
}
