import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/animated_fade_slide.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/about/presentation/about_section.dart';
import 'package:portfolio/src/features/experience/presentation/experience_section.dart';
import 'package:portfolio/src/features/personal_info/presentation/personal_info_section.dart';
import 'package:portfolio/src/features/general/presentation/widgets/sliver_app_bar.dart';
import 'package:portfolio/src/features/project/presentation/project_section.dart';
import 'package:portfolio/src/features/general/provider/scroll_controller.dart';
import 'package:portfolio/src/features/general/provider/section_key_provider.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class GeneralTablet extends ConsumerWidget {
  const GeneralTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Column(
      children: [
        Expanded(
          child: MySelectionArea(
            child: Container(
              color: Theme.of(context).colorScheme.primary,
              child: CustomScrollView(
                controller: scrollController,
                slivers: [
                  const MySliverAppBar(),
                  SliverList.list(
                    children: [
                      Padding(
                        padding: _buildResponsivePadding(context: context),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: AnimatedFadeSlide(
                            offset: const Offset(-128, 0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: PersonalInfoSection(
                                    key: ref.watch(homeSectionKeyProvider),
                                  ),
                                ),
                                gapH100,
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: AboutSection(
                                    key: ref.watch(aboutSectionKeyProvider),
                                  ),
                                ),
                                gapH100,
                                ExperienceSection(
                                  key: ref.watch(experienceSectionKeyProvider),
                                ),
                                gapH100,
                                ProjectSection(
                                  key: ref.watch(projectSectionKeyProvider),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsetsGeometry _buildResponsivePadding({required BuildContext context}) {
    if (Responsive.isTablet(context)) {
      return const EdgeInsets.fromLTRB(48, 60, 48, 88);
    } else if (Responsive.isMobile(context)) {
      return const EdgeInsets.fromLTRB(20, 32, 20, 88);
    }
    return EdgeInsets.zero;
  }
}
