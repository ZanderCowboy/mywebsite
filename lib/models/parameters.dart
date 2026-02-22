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
  });

  factory Parameters.fromJson(Map<String, dynamic> json) =>
      _$ParametersFromJson(json);

  final String? url;
  final String? source;
  final String? emailAddress;
  final String? phoneNumber;
  final String? platform;

  Map<String, dynamic> toJson() => _$ParametersToJson(this);
}
