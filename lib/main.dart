import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/src/app.dart';
import 'package:portfolio/src/localization/app_localizations.dart';
import 'package:url_strategy/url_strategy.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  EasyLocalization.logger.enableBuildModes = [];
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setPathUrlStrategy();
  GoogleFonts.config.allowRuntimeFetching = false;
  await GoogleFonts.pendingFonts([GoogleFonts.nunito()]);
  runApp(
    ProviderScope(
      child: EasyLocalization(
        supportedLocales: AppLocalizations.supportedLocales,
        path: AppLocalizations.path,
        fallbackLocale: AppLocalizations.fallbackLocale,
        child: const MyApp(),
      ),
    ),
  );
}
