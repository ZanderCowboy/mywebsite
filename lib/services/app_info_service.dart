import 'package:package_info_plus/package_info_plus.dart';
import 'package:version/version.dart';

class AppInfoService {
  static Future<String> getAppVersion() async {
    final packageInfo = await PackageInfo.fromPlatform();
    final version = Version.parse(packageInfo.version);
    return '${version.major}.${version.minor}.${version.patch}+'
        '${packageInfo.buildNumber}';
  }
}
