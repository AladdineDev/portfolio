import 'package:easy_localization/easy_localization.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchUrlHelper {
  LaunchUrlHelper._();

  static Future<void> launchURL(String url) async {
    try {
      await launchUrl(Uri.parse(url));
    } catch (e) {
      throw '${tr(LocaleKeys.openUrlError)} $url';
    }
  }
}
