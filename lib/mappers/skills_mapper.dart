// ignore_for_file: use_raw_strings

import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/skills_mapper.auto_mappr.dart';
import 'package:mywebsite/models/enums/star_level.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<SkillDTO, Skill>(
    fields: [
      Field('level', custom: SkillsMapper.setStarLevel),
      Field('imageUrl', custom: SkillsMapper.setImageUrl),
      Field('isNetworkImage', custom: SkillsMapper.setIsNetworkImage),
    ],
  ),
])
class SkillsMapper extends $SkillsMapper {
  static StarLevel setStarLevel(SkillDTO dto) {
    final lower = dto.level.toLowerCase();

    if (lower == 'beginner' || lower == '1') return StarLevel.beginner;
    if (lower == 'intermediate' || lower == '2') return StarLevel.intermediate;
    if (lower == 'advanced' || lower == '3') return StarLevel.advanced;
    if (lower == 'expert' || lower == '4' || lower == '5') {
      return StarLevel.expert;
    }

    return StarLevel.unknown;
  }

  static String setImageUrl(SkillDTO dto) {
    if (dto.imageUrl != null && dto.imageUrl!.isNotEmpty) {
      return dto.imageUrl ?? '';
    }

    return 'assets/images/projects/placeholder.png';
  }

  static bool setIsNetworkImage(SkillDTO dto) {
    final imageUrl = dto.imageUrl;

    if (imageUrl == null || imageUrl.isEmpty) {
      return false;
    }

    final uri = Uri.tryParse(imageUrl);
    if (uri != null &&
        uri.hasScheme &&
        (uri.scheme == 'http' || uri.scheme == 'https')) {
      return true;
    }
    return false;
  }
}
