import 'dart:ui';

import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_provider.g.dart';

@riverpod
class Localization extends _$Localization {
  @override
  Locale build() {
    return basicLocaleListResolution(
      [PlatformDispatcher.instance.locale],
      AppLocalizations.supportedLocales,
    );
  }

  void setLocale(Locale locale) => state = locale;
}
