import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/projects_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<ProjectDTO, Project>(
    fields: [
      Field('isNetworkImage', custom: ProjectsMapper.setIsNetworkImage),
    ],
  ),
])
class ProjectsMapper extends $ProjectsMapper {
  static bool setIsNetworkImage(_) => true;
}
