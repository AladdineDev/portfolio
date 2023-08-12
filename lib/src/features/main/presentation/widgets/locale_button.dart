import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';
import 'package:portfolio/src/common/domain/language.dart';

class LocaleButton extends ConsumerWidget {
  const LocaleButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonLanguages = trList(
      context.locale,
      LocaleKeys.languages,
    );
    final languages = jsonLanguages.map((jsonLocaleInfo) {
      return Language.fromJson(jsonLocaleInfo);
    });

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
              Text(
                language.nativeName ??
                    language.name ??
                    "Language Name ${index + 1}",
              ),
            ],
          ),
        );
      }).toList(),
      onChanged: (locale) async {
        if (locale != null) {
          await context.setLocale(locale);
        }
      },
    );
  }
}
