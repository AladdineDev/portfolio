import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/technology_wrap_chips.dart';
import 'package:portfolio/src/common/widgets/wrap_links.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/domain/project.dart';

class ProjectDescription extends ConsumerWidget {
  const ProjectDescription({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final projectName = project.name;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              projectName != null ? "$projectName " : "",
              style: theme.textTheme.titleMedium
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            const Icon(Icons.open_in_new),
          ],
        ),
        gapH8,
        Row(
          children: [
            Expanded(
              child: Text(
                project.description ?? "",
                style: theme.textTheme.bodyMedium,
              ),
            ),
          ],
        ),
        gapH12,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildLinks(context),
            if (project.links?.isNotEmpty == true) gapH12 else gapH4,
            _buildChips(),
          ],
        ),
      ],
    );
  }

  Widget _buildChips() {
    final projectTechnologies = project.technologies;
    if (projectTechnologies == null) return const SizedBox.shrink();
    return TechnologyWrapChips(technologies: projectTechnologies);
  }

  Widget _buildLinks(BuildContext context) {
    final projectLinks = project.links;
    if (projectLinks == null) return const SizedBox.shrink();
    return WrapLinks(links: projectLinks);
  }
}
