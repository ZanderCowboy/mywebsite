import 'package:json_annotation/json_annotation.dart';

part 'profile_details_dto.g.dart';

@JsonSerializable()
class ProfileDetailsDataDTO {
  const ProfileDetailsDataDTO({
    required this.currentTitle,
    required this.email,
    required this.phone,
    required this.birthday,
    required this.location,
  });

  factory ProfileDetailsDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsDataDTOFromJson(json);

  final List<String> currentTitle;
  final String email;
  final String phone;
  final String birthday;
  final String location;

  Map<String, dynamic> toJson() => _$ProfileDetailsDataDTOToJson(this);
}
