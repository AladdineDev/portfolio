import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/features/experience/presentation/widgets/experience_card.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';

class ExperienceDesktop extends ConsumerStatefulWidget {
  const ExperienceDesktop({super.key});

  @override
  ConsumerState<ExperienceDesktop> createState() => _ExperienceDesktopState();
}

class _ExperienceDesktopState extends ConsumerState<ExperienceDesktop> {
  @override
  Widget build(BuildContext context) {
    final jsonExperiences = trList(context.locale, LocaleKeys.experiences);
    final experiences = jsonExperiences.map((jsonExperience) {
      return Experience.fromJson(jsonExperience);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            tr(LocaleKeys.experienceSectionTitle),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...experiences.mapIndexed((index, experience) {
          return Column(
            children: [
              ExperienceCard(experience: experience),
              if (index != experiences.length - 1) gapH24,
            ],
          );
        }),
      ],
    );
  }
}
