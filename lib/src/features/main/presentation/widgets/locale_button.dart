import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/localization/localization_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

const _languageCode = {
  "en": "English",
  "fr": "Français",
};

class LocaleButton extends ConsumerWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DropdownButton<Locale>(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      value: ref.watch(localizationProvider),
      dropdownColor: Theme.of(context).colorScheme.primary,
      focusNode: FocusNode(canRequestFocus: false),
      focusColor: Colors.transparent,
      items: AppLocalizations.supportedLocales.map((locale) {
        final languageName = _languageCode[locale.languageCode];
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Row(
            children: [
              const Icon(Icons.translate),
              gapW8,
              Text(languageName ?? locale.languageCode),
            ],
          ),
        );
      }).toList(),
      onChanged: (value) {
        if (value != null) {
          ref.read(localizationProvider.notifier).setLocale(value);
        }
      },
    );
  }
}
