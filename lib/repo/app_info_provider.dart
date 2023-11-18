import 'package:csu/entity/entity.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfoProvider {
  AppInfoProvider({
    required this.packageInfo,
  });

  final String appLicenseName = appInfo.licenseName;
  final String appSourceUrl = appInfo.sourceUrl;
  final String appLicenseText = licenseText;
  final PackageInfo packageInfo;
}
