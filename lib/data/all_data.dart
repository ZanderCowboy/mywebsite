import 'package:mywebsite/gen/assets.gen.dart';
import 'package:mywebsite/models/export.dart';

part '_about_me.dart';
part '_educations.dart';
part '_experiences.dart';
part '_projects.dart';
part '_skills.dart';

class AllData {
  List<Skill> get skills => _skills;
  List<Project> get projects => _projects;
  List<Experience> get experiences => _experiences;
  List<Education> get educations => _educations;
  AboutMe get aboutMe => _aboutMe;
}
