import 'dart:developer' as dev;

import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/services/remote_config_service.dart';

class AllData {
  static final RemoteConfigService _remoteConfigService = RemoteConfigService();

  /// Get about me data from Remote Config
  static Future<AboutMeData?> get aboutMe async {
    try {
      return await _remoteConfigService.getAboutMeData();
    } catch (e) {
      dev.log('Error fetching about me data: $e', name: 'AllData');
      return null;
    }
  }

  /// Get profile details from Remote Config
  static Future<ProfileDetailsData?> get profileDetails async {
    try {
      return await _remoteConfigService.getProfileDetails();
    } catch (e) {
      dev.log('Error fetching profile details: $e', name: 'AllData');
      return null;
    }
  }

  /// Get experiences data from Remote Config
  static Future<List<Experience>?> get experiences async {
    try {
      return await _remoteConfigService.getExperienceData();
    } catch (e) {
      dev.log('Error fetching experiences data: $e', name: 'AllData');
      return null;
    }
  }

  /// Get educations data from Remote Config
  static Future<List<Education>?> get educations async {
    try {
      return await _remoteConfigService.getEducationData();
    } catch (e) {
      dev.log('Error fetching educations data: $e', name: 'AllData');
      return null;
    }
  }

  /// Get projects data from Remote Config
  static Future<List<Project>?> get projects async {
    try {
      return await _remoteConfigService.getProjectsData();
    } catch (e) {
      dev.log('Error fetching projects data: $e', name: 'AllData');
      return null;
    }
  }

  /// Get skills data from Remote Config
  static Future<List<Skill>?> get skills async {
    try {
      return await _remoteConfigService.getSkillsData();
    } catch (e) {
      dev.log('Error fetching skills data: $e', name: 'AllData');
      return null;
    }
  }

  /// Get personal details feature flags from Remote Config.
  static Future<Map<RemoteConfigFeatureFlags, bool>> get featureFlags async {
    try {
      return await _remoteConfigService.getFeatureFlags();
    } catch (e) {
      dev.log('Error fetching feature flags: $e', name: 'AllData');
      return {};
    }
  }
}
