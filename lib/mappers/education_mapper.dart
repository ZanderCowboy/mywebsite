import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/education_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<EducationDTO, Education>(
    fields: [
      Field('startDate', custom: EducationMapper.parseStartDate),
      Field('endDate', custom: EducationMapper.parseEndDate),
    ],
  ),
])
class EducationMapper extends $EducationMapper {
  static DateTime parseStartDate(EducationDTO data) {
    final date = DateTime.tryParse(data.startDate ?? '');
    return date ?? DateTime.now();
  }

  static DateTime? parseEndDate(EducationDTO data) {
    final date = DateTime.tryParse(data.endDate ?? '');
    return date;
  }
}
