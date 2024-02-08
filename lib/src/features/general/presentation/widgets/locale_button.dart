import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/data/language_repository.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/common/domain/language.dart';
import 'package:portfolio/src/localization/locale_controller.dart';

class LocaleButton extends ConsumerWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageRepositoryProvider).getLanguages();

    return DropdownButton<Locale>(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 12),
      value: context.locale,
      dropdownColor: Theme.of(context).colorScheme.primary,
      focusNode: FocusNode(canRequestFocus: false),
      focusColor: Colors.transparent,
      items: languages.mapIndexed((index, language) {
        return DropdownMenuItem<Locale>(
          value: Locale(language.code ?? ""),
          child: Row(
            children: [
              const Icon(Icons.translate),
              gapW8,
              _buildLanguageNameText(language),
            ],
          ),
        );
      }).toList(),
      onChanged: (locale) async {
        await _onLocaleChanged(context, ref, locale: locale);
      },
    );
  }

  Future<void> _onLocaleChanged(
    BuildContext context,
    WidgetRef ref, {
    required Locale? locale,
  }) async {
    if (locale != null) {
      await context.setLocale(locale);
      await ref.read(localeControllerProvider).setLocale(locale);
    }
  }

  Text _buildLanguageNameText(Language language) {
    final languageName = language.name;
    final languageNativeName = language.nativeName;
    if (languageNativeName != null) return Text(languageNativeName);
    if (languageName != null) return Text(languageName);
    return Text(tr(LocaleKeys.unknownLanguageError));
  }
}
