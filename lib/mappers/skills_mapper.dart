import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/skills_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<SkillDTO, Skill>(
    fields: [
      Field('isNetworkImage', custom: SkillsMapper.setIsNetworkImage),
    ],
  ),
])
class SkillsMapper extends $SkillsMapper {
  static bool setIsNetworkImage(_) => true;
}
