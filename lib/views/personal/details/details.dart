import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mywebsite/data/all_data.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/util/export.dart';
import 'package:mywebsite/views/personal/details/sections/export.dart';
import 'package:mywebsite/views/personal/details/widgets/export.dart';

part '_details_scroll_layout.dart';
part '_details_tab_layout.dart';

const _sectionCount = 5;

class Details extends HookWidget {
  const Details({
    this.isSmall = false,
    super.key,
  });

  final bool isSmall;

  @override
  Widget build(BuildContext context) {
    final flagsFuture = useMemoized(() => AllData.featureFlags, []);
    final snapshot = useFuture(flagsFuture);
    final flags = snapshot.data ?? _defaultFlags();

    final useV2Layout = flags[RemoteConfigFeatureFlags.useV2Layout] ?? true;

    if (useV2Layout) {
      return _DetailsScrollLayout(
        isSmall: isSmall,
        flags: flags,
      );
    }

    return _DetailsTabLayout(
      isSmall: isSmall,
      flags: flags,
    );
  }
}

Map<RemoteConfigFeatureFlags, bool> _defaultFlags() {
  return {
    for (final f in RemoteConfigFeatureFlags.values) f: false,
  };
}
