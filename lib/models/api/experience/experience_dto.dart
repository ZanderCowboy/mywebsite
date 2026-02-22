import 'package:json_annotation/json_annotation.dart';

part 'experience_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class ExperienceDataDTO {
  const ExperienceDataDTO({
    required this.experience,
  });

  factory ExperienceDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDataDTOFromJson(json);

  final List<ExperienceDTO> experience;

  Map<String, dynamic> toJson() => _$ExperienceDataDTOToJson(this);
}

@JsonSerializable()
class ExperienceDTO {
  const ExperienceDTO({
    required this.role,
    required this.company,
    required this.location,
    required this.language,
    required this.startDate,
    required this.responsibilities,
    this.endDate,
    this.companyImageUrl,
  });

  factory ExperienceDTO.fromJson(Map<String, dynamic> json) =>
      _$ExperienceDTOFromJson(json);

  final String role;
  final String company;
  final String location;
  final String language;
  final String startDate;
  final List<String> responsibilities;
  final String? endDate;
  final String? companyImageUrl;

  Map<String, dynamic> toJson() => _$ExperienceDTOToJson(this);
}
