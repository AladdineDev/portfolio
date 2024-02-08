import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/animated_fade_slide.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/features/about/presentation/about_section.dart';
import 'package:portfolio/src/features/experience/presentation/experience_section.dart';
import 'package:portfolio/src/features/personal_info/presentation/personal_info_section.dart';
import 'package:portfolio/src/features/general/presentation/widgets/app_bar.dart';
import 'package:portfolio/src/features/project/presentation/project_section.dart';
import 'package:portfolio/src/features/general/provider/scroll_controller.dart';
import 'package:portfolio/src/features/general/provider/section_key_provider.dart';

class GeneralDesktop extends ConsumerWidget {
  const GeneralDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Column(
      children: [
        const MyAppBar(),
        Expanded(
          // This stack avoid pixel issue where a line is drawn between the two expanded
          child: Stack(
            children: [
              Container(
                color: Theme.of(context).colorScheme.primary,
              ),
              Row(
                children: [
                  Expanded(
                    child: Listener(
                      onPointerSignal: (PointerSignalEvent event) {
                        if (event is PointerScrollEvent) {
                          scrollController.position.moveTo(
                            scrollController.position.pixels +
                                event.scrollDelta.dy,
                          );
                        }
                      },
                      onPointerPanZoomUpdate: (event) {
                        scrollController.position.moveTo(
                          scrollController.position.pixels + event.panDelta.dy,
                        );
                      },
                      child: MySelectionArea(
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(100, 80, 100, 100),
                          color: Theme.of(context).colorScheme.primary,
                          child: const Align(
                            alignment: Alignment.topRight,
                            child: AnimatedFadeSlide(
                              offset: Offset(-128, 0),
                              child: PersonalInfoSection(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: MySelectionArea(
                      child: Container(
                        color: Theme.of(context).colorScheme.primary,
                        child: SingleChildScrollView(
                          controller: scrollController,
                          padding: const EdgeInsetsDirectional.only(
                            top: 80,
                            end: 140,
                            bottom: 88,
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: SizedBox(
                              width: 520,
                              child: AnimatedFadeSlide(
                                offset: const Offset(128, 0),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 12,
                                      ),
                                      child: AboutSection(
                                        key: ref.watch(aboutSectionKeyProvider),
                                      ),
                                    ),
                                    const SizedBox(height: 120),
                                    ExperienceSection(
                                      key: ref
                                          .watch(experienceSectionKeyProvider),
                                    ),
                                    const SizedBox(height: 120),
                                    ProjectSection(
                                      key: ref.watch(projectSectionKeyProvider),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
