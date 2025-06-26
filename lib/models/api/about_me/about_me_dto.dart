import 'package:freezed_annotation/freezed_annotation.dart';

part 'about_me_dto.freezed.dart';
part 'about_me_dto.g.dart';

@freezed
class AboutMeDataDTO with _$AboutMeDataDTO {
  const factory AboutMeDataDTO({
    required String description,
    required List<SocialPillDTO> socialPills,
    required List<String> professionalSkills,
    required List<String> personalInterests,
  }) = _AboutMeDataDTO;

  factory AboutMeDataDTO.fromJson(Map<String, dynamic> json) =>
      _$AboutMeDataDTOFromJson(json);
}

@freezed
class SocialPillDTO with _$SocialPillDTO {
  const factory SocialPillDTO({
    required String name,
    required String url,
    required String iconUrl,
  }) = _SocialPillDTO;

  factory SocialPillDTO.fromJson(Map<String, dynamic> json) =>
      _$SocialPillDTOFromJson(json);
}
