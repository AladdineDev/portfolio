import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

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
            context.localized.aboutSectionTitleAlt,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          context.localized.about,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
