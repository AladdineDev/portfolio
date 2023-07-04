import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/about/presentation/about_section.dart';
import 'package:portfolio/src/features/experience/presentation/experience_section.dart';
import 'package:portfolio/src/features/introduction/presentation/introduction_section.dart';
import 'package:portfolio/src/features/main/presentation/widgets/app_bar.dart';
import 'package:portfolio/src/features/project/presentation/project_section.dart';
import 'package:portfolio/src/features/main/presentation/provider/scroll_controller.dart';
import 'package:portfolio/src/features/main/presentation/provider/section_key_provider.dart';

class MainDesktop extends ConsumerStatefulWidget {
  const MainDesktop({super.key});

  @override
  ConsumerState<MainDesktop> createState() => _MainDesktopState();
}

class _MainDesktopState extends ConsumerState<MainDesktop> {
  @override
  Widget build(BuildContext context) {
    final scrollController = ref.watch(scrollControllerProvider);

    return Column(
      children: [
        const MyAppBar(),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Listener(
                  onPointerSignal: (PointerSignalEvent event) {
                    if (event is PointerScrollEvent) {
                      scrollController.position.moveTo(
                        scrollController.position.pixels + event.scrollDelta.dy,
                      );
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(100, 80, 100, 100),
                    color: Theme.of(context).colorScheme.primary,
                    child: const Align(
                      alignment: Alignment.topRight,
                      child: IntroductionSection(),
                    ),
                  ),
                ),
              ),
              Expanded(
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
                        child: Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              child: AboutSection(
                                key: ref.watch(aboutSectionKeyProvider),
                              ),
                            ),
                            const SizedBox(height: 120),
                            ExperienceSection(
                              key: ref.watch(experienceSectionKeyProvider),
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
            ],
          ),
        ),
      ],
    );
  }
}
