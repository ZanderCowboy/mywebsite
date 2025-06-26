import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/profile_details_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<ProfileDetailsDataDTO, ProfileDetailsData>(),
])
class ProfileDetailsMapper extends $ProfileDetailsMapper {}
