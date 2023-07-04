import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/experience/data/experience_repository.dart';
import 'package:portfolio/src/features/experience/presentation/widgets/experience_card.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

class ExperienceDesktop extends ConsumerWidget {
  const ExperienceDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final experiences =
        ref.watch(experienceRepositoryProvider).fetchExperiences();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            context.localized.experienceSectionTitle,
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
