import 'package:auto_mappr_annotation/auto_mappr_annotation.dart';
import 'package:mywebsite/mappers/about_me_mapper.auto_mappr.dart';
import 'package:mywebsite/models/export.dart';

@AutoMappr([
  MapType<AboutMeDTO, AboutMeData>(),
  MapType<SocialPillDTO, SocialPill>(),
])
class AboutMeMapper extends $AboutMeMapper {}
