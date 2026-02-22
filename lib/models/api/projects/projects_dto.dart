import 'package:json_annotation/json_annotation.dart';

part 'projects_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ProjectsDataDTO {
  const ProjectsDataDTO({
    required this.projects,
  });

  factory ProjectsDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectsDataDTOFromJson(json);

  final List<ProjectDTO> projects;

  Map<String, dynamic> toJson() => _$ProjectsDataDTOToJson(this);
}

@JsonSerializable()
class ProjectDTO {
  const ProjectDTO({
    required this.name,
    required this.tools,
    required this.description,
    required this.repoLink,
    required this.imageUrl,
  });

  factory ProjectDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectDTOFromJson(json);

  final String name;
  final List<String> tools;
  final String description;
  final String repoLink;
  final String imageUrl;

  Map<String, dynamic> toJson() => _$ProjectDTOToJson(this);
}
