import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/common/widgets/link.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/common/widgets/technology_chip.dart';

class ProjectDescription extends ConsumerWidget {
  const ProjectDescription({super.key, required this.project});

  final Project project;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              "${project.title} ",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
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
                project.description ?? "Description",
                style: Theme.of(context).textTheme.bodyMedium,
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
            _buildChips(context),
          ],
        ),
      ],
    );
  }

  Widget _buildChips(BuildContext context) {
    final projectTechnologies = project.technologies;
    if (projectTechnologies == null) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: projectTechnologies.map((technology) {
        return TechnologyChip(name: technology);
      }).toList(),
    );
  }

  Widget _buildLinks(BuildContext context) {
    final projectLinks = project.links;
    if (projectLinks == null) return const SizedBox.shrink();
    return Wrap(
      spacing: 16,
      runSpacing: 4,
      children: projectLinks.map((link) {
        final projectLinkUrl = link.url;
        final projectLinkDisplay = link.display;
        if (projectLinkUrl == null) return const SizedBox.shrink();
        return Link(
          url: projectLinkUrl,
          displayLink: projectLinkDisplay ?? projectLinkUrl,
          displayLeadingIcon: true,
        );
      }).toList(),
    );
  }
}
