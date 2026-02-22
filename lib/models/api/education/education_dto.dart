import 'package:json_annotation/json_annotation.dart';

part 'education_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class EducationDataDTO {
  const EducationDataDTO({
    required this.education,
  });

  factory EducationDataDTO.fromJson(Map<String, dynamic> json) =>
      _$EducationDataDTOFromJson(json);

  final List<EducationDTO> education;

  Map<String, dynamic> toJson() => _$EducationDataDTOToJson(this);
}

@JsonSerializable()
class EducationDTO {
  const EducationDTO({
    required this.schoolName,
    required this.degree,
    required this.description,
    this.endDate,
    this.fieldOfStudy,
    this.startDate,
    this.imageUrl,
    this.link,
    this.schoolUrl,
    this.dateDisplay,
    this.type,
  });

  factory EducationDTO.fromJson(Map<String, dynamic> json) =>
      _$EducationDTOFromJson(json);

  final String schoolName;
  final String degree;
  final String description;
  final String? endDate;
  final String? fieldOfStudy;
  final String? startDate;
  final String? imageUrl;
  final String? link;
  final String? schoolUrl;
  final String? dateDisplay;
  final String? type;

  Map<String, dynamic> toJson() => _$EducationDTOToJson(this);
}
