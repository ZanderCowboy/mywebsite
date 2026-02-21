import 'package:json_annotation/json_annotation.dart';

part 'skills_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class SkillsDataDTO {
  const SkillsDataDTO({
    required this.skills,
  });

  factory SkillsDataDTO.fromJson(Map<String, dynamic> json) =>
      _$SkillsDataDTOFromJson(json);

  final List<SkillDTO> skills;

  Map<String, dynamic> toJson() => _$SkillsDataDTOToJson(this);
}

@JsonSerializable()
class SkillDTO {
  const SkillDTO({
    required this.name,
    required this.description,
    required this.level,
    required this.imageUrl,
  });

  factory SkillDTO.fromJson(Map<String, dynamic> json) =>
      _$SkillDTOFromJson(json);

  final String name;
  final String description;
  final String level;
  final String imageUrl;

  Map<String, dynamic> toJson() => _$SkillDTOToJson(this);
}
