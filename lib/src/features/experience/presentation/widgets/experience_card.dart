import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/common/widgets/link.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/common/widgets/technology_chip.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/localized_date_extension.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';
import 'package:portfolio/src/utils/string_extension.dart';

class ExperienceCard extends ConsumerWidget {
  const ExperienceCard({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      color: Theme.of(context).colorScheme.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        mouseCursor: MaterialStateMouseCursor.textable,
        onTap: () => _onTap(context),
        borderRadius: BorderRadius.circular(20),
        hoverColor: Theme.of(context).colorScheme.tertiary.withAlpha(40),
        splashColor: Theme.of(context).colorScheme.tertiary.withAlpha(30),
        highlightColor: Theme.of(context).colorScheme.tertiary.withAlpha(20),
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
                        experience.job ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                    gapW24,
                    if (!Responsive.isMobile(context))
                      _buildExperienceDateText(context, ref),
                  ],
                ),
                if (Responsive.isMobile(context))
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        experience.company ?? "",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      gapH4,
                      _buildExperienceDateText(context, ref),
                    ],
                  )
                else
                  Text(
                    experience.company ?? "",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                gapH8,
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        experience.description ?? "",
                        style: Theme.of(context).textTheme.bodyMedium,
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

  Widget _buildExperienceDateText(BuildContext context, WidgetRef ref) {
    final locale = context.locale;
    final startMonth = experience.startMonth?.localizedMonth(locale) ?? "";
    final startYear = experience.startYear?.localizedYear(locale);
    final startDate = startMonth.isEmpty ? startYear : "$startMonth $startYear";
    final endMonth = experience.endMonth?.localizedMonth(locale) ?? "";
    final endYear = experience.endYear?.localizedYear(locale);
    String? endDate;
    if (experience.isPresent == true) {
      endDate = tr(LocaleKeys.present);
    } else {
      endDate = endMonth.isEmpty ? endYear : "$endMonth $endYear";
    }
    if (startDate == null || endDate == null) return const Text("");
    return Text(
      "${startDate.capitalize()} - ${endDate.capitalize()}",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }

  Widget _buildChips() {
    final experienceTechnologies = experience.technologies;
    if (experienceTechnologies == null) return const SizedBox.shrink();
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: experienceTechnologies.map((technology) {
        return TechnologyChip(name: technology);
      }).toList(),
    );
  }

  Widget _buildLinks() {
    final experienceLinks = experience.links;
    if (experienceLinks == null) return const SizedBox.shrink();
    return Wrap(
      spacing: 16,
      runSpacing: 4,
      children: experienceLinks.where((link) => link.url != null).map((link) {
        final experienceLinkUrl = link.url;
        final experienceLinkDisplay = link.display;
        if (experienceLinkUrl == null) return const SizedBox.shrink();
        return Link(
          url: experienceLinkUrl,
          displayLink: experienceLinkDisplay ?? experienceLinkUrl,
          displayLeadingIcon: true,
        );
      }).toList(),
    );
  }
}
