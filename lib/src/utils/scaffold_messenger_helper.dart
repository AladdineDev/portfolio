import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class ScaffoldMessengerHelper {
  ScaffoldMessengerHelper._();

  static void showLaunchUrlError(BuildContext context, {String? url}) {
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("${tr(LocaleKeys.openUrlError)} $url"),
        ),
      );
    }
  }
}
