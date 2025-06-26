import 'package:freezed_annotation/freezed_annotation.dart';

part 'experience_dto.freezed.dart';
part 'experience_dto.g.dart';

@freezed
class ExperienceDataDTO with _$ExperienceDataDTO {
  const factory ExperienceDataDTO({
    required List<ExperienceDTO> experience,
  }) = _ExperienceDataDTO;

  factory ExperienceDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDataDTOFromJson(json);
}

@freezed
class ExperienceDTO with _$ExperienceDTO {
  const factory ExperienceDTO({
    required String role,
    required String company,
    required String location,
    required String language,
    required String startDate,
    required List<String> responsibilities,
    String? endDate,
    String? companyImageUrl,
  }) = _ExperienceDTO;

  factory ExperienceDTO.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDTOFromJson(json);
}
