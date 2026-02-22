import 'package:json_annotation/json_annotation.dart';

part 'parameters.g.dart';

@JsonSerializable(explicitToJson: true)
class Parameters {
  Parameters({
    this.url,
    this.source,
    this.emailAddress,
    this.phoneNumber,
    this.platform,
    this.tabName,
    this.itemType,
    this.itemName,
    this.section,
    this.linkType,
  });

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  final String? url;
  final String? source;
  final String? emailAddress;
  final String? phoneNumber;
  final String? platform;
  final String? tabName;
  final String? itemType;
  final String? itemName;
  final String? section;
  final String? linkType;

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}
