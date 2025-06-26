import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/experience_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<ExperienceDTO, Experience>(
    fields: [
      Field('startDate', custom: ExperienceMapper.parseStartDate),
      Field('endDate', custom: ExperienceMapper.parseEndDate),
    ],
  ),
])
class ExperienceMapper extends $ExperienceMapper {
  static DateTime parseStartDate(ExperienceDTO data) {
    final date = DateTime.tryParse(data.startDate);
    return date ?? DateTime.now();
  }

  static DateTime? parseEndDate(ExperienceDTO data) {
    final date = DateTime.tryParse(data.endDate ?? '');
    return date;
  }
}
