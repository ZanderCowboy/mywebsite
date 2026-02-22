import 'package:mywebsite/mappers/export.dart';
import 'package:mywebsite/models/api/export.dart';
import 'package:mywebsite/models/domain/export.dart';
import 'package:mywebsite/models/enums/remote_config_keys.dart';
import 'package:mywebsite/services/remote_config_service.dart';

class RemoteConfigRepository {
  RemoteConfigRepository(this.remoteConfigService);

  final RemoteConfigService remoteConfigService;

  Future<AboutMeData?> getAboutMeData() async {
    try {
      final data =
          await remoteConfigService.getJson(RemoteConfigKeys.aboutMe.key);
      final dto = AboutMeDTO.fromJson(data);
      final aboutMe = AboutMeMapper().convert<AboutMeDTO, AboutMeData>(dto);

      return aboutMe;
    } catch (e) {
      return null;
    }
  }

  Future<ProfileDetailsData?> getProfileDetails() async {
    try {
      final data = await remoteConfigService
          .getJson(RemoteConfigKeys.profileDetails.key);
      final dto = ProfileDetailsDataDTO.fromJson(data);
      final profileDetails = ProfileDetailsMapper()
          .convert<ProfileDetailsDataDTO, ProfileDetailsData>(dto);

      return profileDetails;
    } catch (e) {
      return null;
    }
  }

  Future<List<Experience>?> getExperienceData() async {
    try {
      final data =
          await remoteConfigService.getJson(RemoteConfigKeys.experience.key);
      final dto = ExperienceDataDTO.fromJson(data);
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

  Future<List<Education>?> getEducationData() async {
    try {
      final data =
          await remoteConfigService.getJson(RemoteConfigKeys.education.key);
      final dto = EducationDataDTO.fromJson(data);
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

  Future<List<Project>?> getProjectsData() async {
    try {
      final data =
          await remoteConfigService.getJson(RemoteConfigKeys.projects.key);
      final dto = ProjectsDataDTO.fromJson(data);
      final projects = dto.projects
          .map((item) => ProjectsMapper().convert<ProjectDTO, Project>(item))
          .toList();

      return projects;
    } catch (e) {
      return null;
    }
  }

  Future<List<Skill>?> getSkillsData() async {
    try {
      final data =
          await remoteConfigService.getJson(RemoteConfigKeys.skills.key);
      final dto = SkillsDataDTO.fromJson(data);
      final skills = dto.skills
          .map((item) => SkillsMapper().convert<SkillDTO, Skill>(item))
          .toList();

      return skills;
    } catch (e) {
      return null;
    }
  }
}
