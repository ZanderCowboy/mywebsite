import 'dart:convert';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mywebsite/mixin/remote_config_mixin.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';

class RemoteConfigService with RemoteConfigGetters {
  factory RemoteConfigService() {
    return _instance;
  }

  RemoteConfigService._internal();
  static final RemoteConfigService _instance = RemoteConfigService._internal();

  final FirebaseRemoteConfig _remoteConfig = FirebaseRemoteConfig.instance;

  @override
  FirebaseRemoteConfig get remoteConfig => _remoteConfig;

  Future<void> initialize() async {
    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }

  Future<Map<String, dynamic>> getJson(String key) async {
    final jsonString = await getString(key);

    if (jsonString.isEmpty) return {};

    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    return jsonData;
  }

  Future<String?> getBackgroundImageUrl() async {
    return getString(RemoteConfigImages.backgroundImage.imageName);
  }

  Future<String?> getProfileImageUrl() async {
    return getString(RemoteConfigImages.profileImage.imageName);
  }

  /// Loads all personal-details feature flags in one call.
  Future<Map<RemoteConfigFeatureFlags, bool>> getFeatureFlags() async {
    final entries = await Future.wait(
      RemoteConfigFeatureFlags.values.map(
        (flag) async => MapEntry(flag, await getBool(flag.key)),
      ),
    );
    return Map.fromEntries(entries);
  }

  Future<Map<RemoteConfigDashboard, String>> getDashboard() async {
    final entries = await Future.wait(
      RemoteConfigDashboard.values.map(
        (flag) async => MapEntry(flag, await getString(flag.key)),
      ),
    );
    return Map.fromEntries(entries);
  }
}
