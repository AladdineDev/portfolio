import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/about/presentation/about_section.dart';
import 'package:portfolio/src/features/experience/presentation/experience_section.dart';
import 'package:portfolio/src/features/introduction/presentation/introduction_section.dart';
import 'package:portfolio/src/features/main/presentation/widgets/sliver_app_bar.dart';
import 'package:portfolio/src/features/project/presentation/project_section.dart';
import 'package:portfolio/src/features/main/presentation/provider/scroll_controller.dart';
import 'package:portfolio/src/features/main/presentation/provider/section_key_provider.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';

class MainTablet extends ConsumerStatefulWidget {
  const MainTablet({super.key});

  @override
  ConsumerState<MainTablet> createState() => _MainTabletState();
}

class _MainTabletState extends ConsumerState<MainTablet> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Column(
      children: [
        Expanded(
          child: Container(
            color: Theme.of(context).colorScheme.primary,
            child: CustomScrollView(
              controller: scrollController,
              slivers: [
                const MySliverAppBar(),
                SliverList.list(
                  children: [
                    Padding(
                      padding: _buildResponsivePadding(),
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: IntroductionSection(
                                key: ref.watch(homeSectionKeyProvider),
                              ),
                            ),
                            gapH100,
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
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
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  EdgeInsetsGeometry _buildResponsivePadding() {
    if (Responsive.isTablet(context)) {
      return const EdgeInsets.fromLTRB(48, 60, 48, 88);
    } else if (Responsive.isMobile(context)) {
      return const EdgeInsets.fromLTRB(20, 32, 20, 88);
    }
    return EdgeInsets.zero;
  }
}
