import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/export.dart';

part '_about_me.dart';
part '_educations.dart';
part '_experiences.dart';
part '_projects.dart';
part '_skills.dart';

class AllData {
  static List<Skill> get skills => _skills;
  static List<Project> get projects => _projects;
  static List<Experience> get experiences => _experiences;
  static List<Education> get educations => _educations;
  static AboutMe get aboutMe => _aboutMe;
}
