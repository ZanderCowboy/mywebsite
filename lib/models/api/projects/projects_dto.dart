import 'package:freezed_annotation/freezed_annotation.dart';

part 'projects_dto.freezed.dart';
part 'projects_dto.g.dart';

@freezed
class ProjectsDataDTO with _$ProjectsDataDTO {
  const factory ProjectsDataDTO({
    required List<ProjectDTO> projects,
  }) = _ProjectsDataDTO;

  factory ProjectsDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectsDataDTOFromJson(json);
}

@freezed
class ProjectDTO with _$ProjectDTO {
  const factory ProjectDTO({
    required String name,
    required List<String> tools,
    required String description,
    required String repoLink,
    required String imageUrl,
  }) = _ProjectDTO;

  factory ProjectDTO.fromJson(Map<String, dynamic> json) =>
      _$ProjectDTOFromJson(json);
}
