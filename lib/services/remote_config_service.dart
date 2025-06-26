import 'dart:convert';
import 'dart:developer';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:mywebsite/mappers/export.dart';
import 'package:mywebsite/mixin/remote_config_mixin.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/models/export.dart';

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

  /// Fetch and parse about me data from Remote Config
  Future<AboutMeData?> getAboutMeData() async {
    try {
      final jsonString = await getString(RemoteConfigKeys.aboutMe.key);
      log('jsonString: $jsonString');
      if (jsonString.isEmpty) return null;

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dto = AboutMeDataDTO.fromJson(jsonData);

      final aboutMe = AboutMeMapper().convert<AboutMeDataDTO, AboutMeData>(
        dto,
      );
      return aboutMe;
    } catch (e) {
      return null;
    }
  }

  /// Fetch and parse profile details from Remote Config
  Future<ProfileDetailsData?> getProfileDetails() async {
    try {
      final jsonString = await getString(RemoteConfigKeys.profileDetails.key);
      log('jsonString: $jsonString');
      if (jsonString.isEmpty) return null;

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dto = ProfileDetailsDataDTO.fromJson(jsonData);

      final profileDetails = ProfileDetailsMapper()
          .convert<ProfileDetailsDataDTO, ProfileDetailsData>(
        dto,
      );

      return profileDetails;
    } catch (e) {
      return null;
    }
  }

  /// Fetch and parse experience data from Remote Config
  Future<List<Experience>?> getExperienceData() async {
    try {
      final jsonString = await getString(RemoteConfigKeys.experience.key);
      log('jsonString: $jsonString');
      if (jsonString.isEmpty) return null;

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dto = ExperienceDataDTO.fromJson(jsonData);

      final experiences = dto.experience
          .map(
            (item) =>
                ExperienceMapper().convert<ExperienceDTO, Experience>(item),
          )
          .toList();

      return experiences;
    } catch (e) {
      return null;
    }
  }

  /// Fetch and parse education data from Remote Config
  Future<List<Education>?> getEducationData() async {
    try {
      final jsonString = await getString(RemoteConfigKeys.education.key);
      log('jsonString: $jsonString');
      if (jsonString.isEmpty) return null;

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dto = EducationDataDTO.fromJson(jsonData);

      final educations = dto.education
          .map(
            (item) => EducationMapper().convert<EducationDTO, Education>(item),
          )
          .toList();

      return educations;
    } catch (e) {
      return null;
    }
  }

  /// Fetch and parse projects data from Remote Config
  Future<List<Project>?> getProjectsData() async {
    try {
      final jsonString = await getString(RemoteConfigKeys.projects.key);
      log('jsonString: $jsonString');
      if (jsonString.isEmpty) return null;

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dto = ProjectsDataDTO.fromJson(jsonData);

      final projects = dto.projects
          .map((item) => ProjectsMapper().convert<ProjectDTO, Project>(item))
          .toList();

      return projects;
    } catch (e) {
      return null;
    }
  }

  /// Fetch and parse skills data from Remote Config
  Future<List<Skill>?> getSkillsData() async {
    try {
      final jsonString = await getString(RemoteConfigKeys.skills.key);
      log('jsonString: $jsonString');
      if (jsonString.isEmpty) return null;

      final jsonData = json.decode(jsonString) as Map<String, dynamic>;
      final dto = SkillsDataDTO.fromJson(jsonData);

      final skills = dto.skills
          .map((item) => SkillsMapper().convert<SkillDTO, Skill>(item))
          .toList();

      return skills;
    } catch (e) {
      return null;
    }
  }

  Future<String?> getBackgroundImageUrl() async {
    return getString(RemoteConfigImages.backgroundImage.imageName);
  }

  Future<String?> getProfileImageUrl() async {
    return getString(RemoteConfigImages.profileImage.imageName);
  }
}
