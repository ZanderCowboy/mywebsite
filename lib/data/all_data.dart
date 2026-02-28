import 'dart:developer' as dev;

import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/export.dart';
import 'package:mywebsite/repository/remote_config_repository.dart';
import 'package:mywebsite/services/remote_config_service.dart';

class AllData {
  AllData._();

  static final AllData _instance = AllData._();
  static AllData get instance => _instance;

  final RemoteConfigService _remoteConfigService = RemoteConfigService();
  late final RemoteConfigRepository _remoteConfigRepository =
      RemoteConfigRepository(_remoteConfigService);

  AboutMeData? _aboutMe;
  ProfileDetailsData? _profileDetails;
  List<Experience>? _experiences;
  List<Education>? _educations;
  List<Project>? _projects;
  List<Skill>? _skills;
  Map<RemoteConfigFeatureFlags, bool> _featureFlags = {};
  Map<RemoteConfigDashboard, String> _dashboard = {};

  bool _isLoaded = false;
  bool _hasError = false;
  String? _errorMessage;

  bool get isLoaded => _isLoaded;
  bool get hasError => _hasError;
  String? get errorMessage => _errorMessage;

  Future<void> initialize() async {
    if (_isLoaded) return;

    try {
      dev.log('Loading all data...', name: 'AllData');

      final results = await Future.wait([
        _remoteConfigRepository.getAboutMeData(),
        _remoteConfigRepository.getProfileDetails(),
        _remoteConfigRepository.getExperienceData(),
        _remoteConfigRepository.getEducationData(),
        _remoteConfigRepository.getProjectsData(),
        _remoteConfigRepository.getSkillsData(),
        _remoteConfigService.getFeatureFlags(),
        _remoteConfigService.getDashboard(),
      ]);

      Map<RemoteConfigFeatureFlags, bool> defaultFlags() {
        return {
          for (final f in RemoteConfigFeatureFlags.values) f: false,
        };
      }

      Map<RemoteConfigDashboard, String> defaultDashboard() {
        return {
          for (final f in RemoteConfigDashboard.values) f: '',
        };
      }

      _aboutMe = results[0] as AboutMeData?;
      _profileDetails = results[1] as ProfileDetailsData?;
      _experiences = results[2] as List<Experience>?;
      _educations = results[3] as List<Education>?;
      _projects = results[4] as List<Project>?;
      _skills = results[5] as List<Skill>?;
      _featureFlags =
          (results[6] ?? defaultFlags()) as Map<RemoteConfigFeatureFlags, bool>;
      _dashboard = (results[7] ?? defaultDashboard())
          as Map<RemoteConfigDashboard, String>;

      _isLoaded = true;
      _hasError = false;
      dev.log('All data loaded successfully', name: 'AllData');
    } catch (e, stackTrace) {
      _hasError = true;
      _errorMessage = e.toString();
      dev.log(
        'Error loading data: $e',
        name: 'AllData',
        error: e,
        stackTrace: stackTrace,
      );
      rethrow;
    }
  }

  Future<void> reload() async {
    _isLoaded = false;
    _hasError = false;
    _errorMessage = null;
    await initialize();
  }

  AboutMeData? get aboutMe {
    if (!_isLoaded) {
      dev.log(
        'Accessing aboutMe before initialization',
        name: 'AllData',
      );
    }
    return _aboutMe;
  }

  ProfileDetailsData? get profileDetails {
    if (!_isLoaded) {
      dev.log(
        'Accessing profileDetails before initialization',
        name: 'AllData',
      );
    }
    return _profileDetails;
  }

  List<Experience>? get experiences {
    if (!_isLoaded) {
      dev.log(
        'Accessing experiences before initialization',
        name: 'AllData',
      );
    }
    return _experiences;
  }

  List<Education>? get educations {
    if (!_isLoaded) {
      dev.log(
        'Accessing educations before initialization',
        name: 'AllData',
      );
    }
    return _educations;
  }

  List<Project>? get projects {
    if (!_isLoaded) {
      dev.log(
        'Accessing projects before initialization',
        name: 'AllData',
      );
    }
    return _projects;
  }

  List<Skill>? get skills {
    if (!_isLoaded) {
      dev.log(
        'Accessing skills before initialization',
        name: 'AllData',
      );
    }
    return _skills;
  }

  Map<RemoteConfigFeatureFlags, bool> get featureFlags {
    if (!_isLoaded) {
      dev.log(
        'Accessing featureFlags before initialization',
        name: 'AllData',
      );
    }
    return _featureFlags;
  }

  Map<RemoteConfigDashboard, String> get dashboard {
    if (!_isLoaded) {
      dev.log(
        'Accessing dashboard before initialization',
        name: 'AllData',
      );
    }
    return _dashboard;
  }
}
