import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/data/language_repository.dart';
import 'package:portfolio/src/common/widgets/animated_fade_slide.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/general/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/general/presentation/widgets/drawer_button.dart';
import 'package:portfolio/src/features/general/presentation/widgets/locale_button.dart';

import 'package:portfolio/src/features/general/provider/section_key_provider.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class EndDrawer extends ConsumerWidget {
  const EndDrawer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (Responsive.isDesktop(context)) return const SizedBox.shrink();
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.only(top: 8),
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.close),
              ),
            ),
          ),
          Divider(
            height: 8,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
          Expanded(
            child: MySelectionArea(
              mouseCursor: WidgetStateMouseCursor.clickable,
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      gapH40,
                      const AnimatedFadeSlide(
                        offset: Offset(0, -64),
                        duration: Duration(milliseconds: 350),
                        child: DarkModeSwitch(),
                      ),
                      gapH80,
                      AnimatedFadeSlide(
                        offset: const Offset(128, 0),
                        duration: const Duration(milliseconds: 300),
                        child: MyDrawerButton(
                          title: tr(LocaleKeys.homeSectionTitle),
                          sectionKey: ref.watch(homeSectionKeyProvider),
                        ),
                      ),
                      gapH40,
                      AnimatedFadeSlide(
                        offset: const Offset(112, 0),
                        duration: const Duration(milliseconds: 350),
                        child: MyDrawerButton(
                          title: tr(LocaleKeys.aboutSectionTitle),
                          sectionKey: ref.watch(aboutSectionKeyProvider),
                        ),
                      ),
                      gapH40,
                      AnimatedFadeSlide(
                        offset: const Offset(96, 0),
                        duration: const Duration(milliseconds: 375),
                        child: MyDrawerButton(
                          title: tr(LocaleKeys.experienceSectionTitle),
                          sectionKey: ref.watch(experienceSectionKeyProvider),
                        ),
                      ),
                      gapH40,
                      AnimatedFadeSlide(
                        offset: const Offset(80, 0),
                        duration: const Duration(milliseconds: 400),
                        child: MyDrawerButton(
                          title: tr(LocaleKeys.projectsSectionTitle),
                          sectionKey: ref.watch(projectSectionKeyProvider),
                        ),
                      ),
                      gapH80,
                      AnimatedFadeSlide(
                        offset: const Offset(0, 64),
                        duration: const Duration(milliseconds: 350),
                        child: _buildLocaleButton(context, ref),
                      ),
                      gapH40,
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLocaleButton(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageRepositoryProvider).getLanguages();
    if (languages.length > 1) return const LocaleButton();
    return const SizedBox.shrink();
  }
}
