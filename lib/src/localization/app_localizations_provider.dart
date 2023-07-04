import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/localization/localization_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_localizations_provider.g.dart';

@riverpod
AppLocalizations appLocalizations<AppLocalizations>(AppLocalizationsRef ref) {
  final currentLocale = ref.watch(localizationProvider);
  return lookupAppLocalizations(currentLocale) as AppLocalizations;
}
