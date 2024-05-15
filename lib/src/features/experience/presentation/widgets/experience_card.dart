import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/technology_wrap_chips.dart';
import 'package:portfolio/src/common/widgets/wrap_links.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/features/experience/presentation/widgets/experience_date_text.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';

class ExperienceCard extends ConsumerWidget {
  const ExperienceCard({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Material(
      color: theme.colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        mouseCursor: WidgetStateMouseCursor.textable,
        onTap: () => _onTap(context),
        borderRadius: BorderRadius.circular(20),
        hoverColor: theme.colorScheme.tertiary.withAlpha(40),
        splashColor: theme.colorScheme.tertiary.withAlpha(30),
        highlightColor: theme.colorScheme.tertiary.withAlpha(20),
        child: MouseRegion(
          cursor: SystemMouseCursors.basic,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        experience.role ?? "",
                        style: theme.textTheme.titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    gapW24,
                    if (!Responsive.isMobile(context))
                      ExperienceDateText(experience: experience),
                  ],
                ),
                if (Responsive.isMobile(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.company ?? "",
                        style: theme.textTheme.titleMedium,
                      ),
                      gapH4,
                      ExperienceDateText(experience: experience),
                    ],
                  )
                else
                  Text(
                    experience.company ?? "",
                    style: theme.textTheme.titleMedium,
                  ),
                gapH8,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        experience.description ?? "",
                        style: theme.textTheme.bodyMedium,
                      ),
                    ),
                  ],
                ),
                gapH12,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildLinks(),
                    if (experience.links?.isNotEmpty == true) gapH12 else gapH4,
                    _buildChips(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) async {
    final url = experience.url;
    if (url == null) return;
    try {
      await LaunchUrlHelper.launchURL(url);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessengerHelper.showLaunchUrlError(context, url: url);
      }
    }
  }

  Widget _buildChips() {
    final experienceTechnologies = experience.technologies;
    if (experienceTechnologies == null) return const SizedBox.shrink();
    return TechnologyWrapChips(technologies: experienceTechnologies);
  }

  Widget _buildLinks() {
    final experienceLinks = experience.links;
    if (experienceLinks == null) return const SizedBox.shrink();
    return WrapLinks(links: experienceLinks);
  }
}
