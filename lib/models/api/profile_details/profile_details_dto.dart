import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile_details_dto.freezed.dart';
part 'profile_details_dto.g.dart';

@freezed
class ProfileDetailsDataDTO with _$ProfileDetailsDataDTO {
  const factory ProfileDetailsDataDTO({
    required List<String> currentTitle,
    required String email,
    required String phone,
    required String birthday,
    required String location,
  }) = _ProfileDetailsDataDTO;

  factory ProfileDetailsDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsDataDTOFromJson(json);
}
