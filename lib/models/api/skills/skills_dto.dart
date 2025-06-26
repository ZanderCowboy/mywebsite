import 'package:freezed_annotation/freezed_annotation.dart';

part 'skills_dto.freezed.dart';
part 'skills_dto.g.dart';

@freezed
class SkillsDataDTO with _$SkillsDataDTO {
  const factory SkillsDataDTO({
    required List<SkillDTO> skills,
  }) = _SkillsDataDTO;

  factory SkillsDataDTO.fromJson(Map<String, dynamic> json) =>
      _$SkillsDataDTOFromJson(json);
}

@freezed
class SkillDTO with _$SkillDTO {
  const factory SkillDTO({
    required String name,
    required String description,
    required String level,
    required String imageUrl,
  }) = _SkillDTO;

  factory SkillDTO.fromJson(Map<String, dynamic> json) =>
      _$SkillDTOFromJson(json);
}
