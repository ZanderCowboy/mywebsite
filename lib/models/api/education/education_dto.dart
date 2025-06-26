import 'package:freezed_annotation/freezed_annotation.dart';

part 'education_dto.freezed.dart';
part 'education_dto.g.dart';

@freezed
class EducationDataDTO with _$EducationDataDTO {
  const factory EducationDataDTO({
    required List<EducationDTO> education,
  }) = _EducationDataDTO;

  factory EducationDataDTO.fromJson(Map<String, dynamic> json) =>
      _$EducationDataDTOFromJson(json);
}

@freezed
class EducationDTO with _$EducationDTO {
  const factory EducationDTO({
    required String schoolName,
    required String degree,
    required String description,
    String? endDate,
    String? fieldOfStudy,
    String? startDate,
    String? imageUrl,
    String? link,
    String? schoolUrl,
  }) = _EducationDTO;

  factory EducationDTO.fromJson(Map<String, dynamic> json) =>
      _$EducationDTOFromJson(json);
}
