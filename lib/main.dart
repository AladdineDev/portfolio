import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/app_startup.dart';
import 'package:portfolio/src/localization/app_localizations.dart';
import 'package:portfolio/src/localization/locale_controller.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  EasyLocalization.logger.enableBuildModes = [];
  setPathUrlStrategy();
  GoogleFonts.config.allowRuntimeFetching = false;
  final supportedLocales = await AppLocalizations.supportedLocales();
  runApp(
    ProviderScope(
      child: AppStartupWidget(
        onLoaded: (context) {
          return Consumer(
            builder: (context, ref, child) {
              ref.watch(localeControllerProvider);
              return EasyLocalization(
                supportedLocales: supportedLocales,
                path: AppLocalizations.translationsPath,
                fallbackLocale: supportedLocales.first,
                child: const MyApp(),
              );
            },
          );
        },
      ),
    ),
  );
}
