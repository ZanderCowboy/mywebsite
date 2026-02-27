import 'dart:convert';
import 'dart:developer';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
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
    // In debug mode, skip remote config initialization
    if (kDebugMode) {
      log(
        '[DEBUG] Skipping Remote Config initialization - using mock data',
      );
      return;
    }

    await _remoteConfig.setConfigSettings(
      RemoteConfigSettings(
        fetchTimeout: const Duration(minutes: 1),
        minimumFetchInterval: const Duration(hours: 1),
      ),
    );
    await _remoteConfig.fetchAndActivate();
  }

  Future<Map<String, dynamic>> getJson(String key) async {
    // In debug mode, load from local assets
    if (kDebugMode) {
      return _loadMockData(key);
    }

    final jsonString = await getString(key);

    if (jsonString.isEmpty) return {};

    final jsonData = json.decode(jsonString) as Map<String, dynamic>;

    return jsonData;
  }

  /// Load mock data from assets for debug mode
  Future<Map<String, dynamic>> _loadMockData(String key) async {
    try {
      final assetPath = 'assets/mock_data/$key.json';
      final jsonString = await rootBundle.loadString(assetPath);
      return json.decode(jsonString) as Map<String, dynamic>;
    } catch (e) {
      if (kDebugMode) {
        print('Error loading mock data for $key: $e');
      }
      return {};
    }
  }

  Future<String?> getBackgroundImageUrl() async {
    // In debug mode, use placeholder image
    if (kDebugMode) {
      return 'assets/images/home_page_background.jpg';
    }
    return getString(RemoteConfigImages.backgroundImage.imageName);
  }

  Future<String?> getProfileImageUrl() async {
    // In debug mode, use placeholder image
    if (kDebugMode) {
      return 'assets/images/home_page_background.jpg';
    }
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
