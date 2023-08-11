import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/shared/widgets/link.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/shared/widgets/technology_chip.dart';

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
            _buildLink(context),
            if (project.url != null) gapH12 else gapH4,
            _buildChips(context),
          ],
        ),
      ],
    );
  }

  Widget _buildChips(BuildContext context) {
    if (project.technologies == null) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: project.technologies!.map((technology) {
        return TechnologyChip(name: technology);
      }).toList(),
    );
  }

  Widget _buildLink(BuildContext context) {
    final projectCreditUrl = project.link?.url;
    final projectCreditDisplay = project.link?.display;
    if (projectCreditUrl == null) return const SizedBox.shrink();
    return Link(
      url: projectCreditUrl,
      displayLink: projectCreditDisplay ?? projectCreditUrl,
      displayLeadingIcon: true,
    );
  }
}
