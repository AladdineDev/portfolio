import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class AboutDesktop extends ConsumerWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text(
            tr(LocaleKeys.aboutSectionTitleAlt),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          tr(LocaleKeys.aboutDescription),
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
