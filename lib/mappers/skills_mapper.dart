// ignore_for_file: use_raw_strings

import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/skills_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<SkillDTO, Skill>(
    fields: [
      Field('imageUrl', custom: SkillsMapper.setImageUrl),
      Field('isNetworkImage', custom: SkillsMapper.setIsNetworkImage),
    ],
  ),
])
class SkillsMapper extends $SkillsMapper {
  static String setImageUrl(SkillDTO dto) {
    if (dto.imageUrl != null && dto.imageUrl!.isNotEmpty) {
      return dto.imageUrl ?? '';
    }

    return 'assets\\images\\projects\\placeholder.png';
  }

  static bool setIsNetworkImage(SkillDTO dto) {
    if (dto.imageUrl != null && dto.imageUrl!.isNotEmpty) {
      return true;
    }
    return false;
  }
}
