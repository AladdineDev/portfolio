import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            'Profile', //context.localized.aboutSectionTitleAlt,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          'A highly skilled software engineer with 5 years of experience '
          'specializing in mobile application and API developments. Proficient '
          'in cross-platform development using Flutter and experienced in '
          'native app development with Kotlin and API development with Java '
          '(Spring boot). Demonstrates expertise in requirement gathering, '
          'analysis, software modeling, and design. Quick learner with a track '
          'record of mastering new technologies. Equally successful in both team '
          'and self-directed settings.', //context.localized.about,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
