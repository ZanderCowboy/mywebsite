import 'package:json_annotation/json_annotation.dart';

part 'about_me_dto.g.dart';

@JsonSerializable(explicitToJson: true)
class AboutMeDTO {
  const AboutMeDTO({
    required this.description,
    required this.socialPills,
    required this.professionalSkills,
    required this.personalInterests,
    this.cvLink,
    this.quote,
    this.ongoingProjectsText,
  });

  factory AboutMeDTO.fromJson(Map<String, dynamic> json) =>
      _$AboutMeDTOFromJson(json);

  final String description;
  final List<SocialPillDTO> socialPills;
  final List<String> professionalSkills;
  final List<String> personalInterests;
  final String? cvLink;
  final String? quote;
  final String? ongoingProjectsText;

  Map<String, dynamic> toJson() => _$AboutMeDTOToJson(this);
}

@JsonSerializable()
class SocialPillDTO {
  const SocialPillDTO({
    required this.name,
    required this.url,
    required this.iconUrl,
  });

  factory SocialPillDTO.fromJson(Map<String, dynamic> json) =>
      _$SocialPillDTOFromJson(json);

  final String name;
  final String url;
  final String iconUrl;

  Map<String, dynamic> toJson() => _$SocialPillDTOToJson(this);
}
