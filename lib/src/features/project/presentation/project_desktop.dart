import 'package:collection/collection.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/features/project/presentation/widgets/project_card.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';

class ProjectDesktop extends ConsumerWidget {
  const ProjectDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonProjects = trList(
      context.locale,
      LocaleKeys.projects,
    );
    final projects = jsonProjects.map((jsonProject) {
      return Project.fromJson(jsonProject);
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12, bottom: 20),
          child: Text(
            tr(LocaleKeys.projectsSectionTitle),
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        ...projects.mapIndexed((index, project) {
          return Column(
            children: [
              ProjectCard(project: project),
              if (index != projects.length - 1) gapH24,
            ],
          );
        }),
      ],
    );
  }
}
