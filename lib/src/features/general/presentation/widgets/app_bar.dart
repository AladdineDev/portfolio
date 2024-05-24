import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/data/language_repository.dart';
import 'package:portfolio/src/common/widgets/animated_fade_slide.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/general/presentation/widgets/app_bar_button.dart';
import 'package:portfolio/src/features/general/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/general/presentation/widgets/locale_button.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/features/general/provider/section_key_provider.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MySelectionArea(
      child: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Theme.of(context).colorScheme.secondary,
        centerTitle: false,
        titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
            ),
        title: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: GestureDetector(
            onTap: () => _scrollToTop(context, ref),
            child: SizedBox(
              height: kToolbarHeight,
              child: SelectionContainer.disabled(
                child: AnimatedFadeSlide(
                  offset: const Offset(-64, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        IconData(
                          0xedc3,
                          fontFamily: "FontAwesome",
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(tr(LocaleKeys.portfolio)),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        actions: [
          if (Responsive.isDesktop(context))
            AnimatedFadeSlide(
              offset: const Offset(64, 0),
              child: Row(
                children: [
                  AppBarButton(
                    title: tr(LocaleKeys.aboutSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(ref.watch(aboutSectionKeyProvider));
                    },
                  ),
                  AppBarButton(
                    title: tr(LocaleKeys.experienceSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(
                        ref.watch(experienceSectionKeyProvider),
                      );
                    },
                  ),
                  AppBarButton(
                    title: tr(LocaleKeys.projectsSectionTitle),
                    onPressed: () {
                      _onAppBarButtonTap(ref.watch(projectSectionKeyProvider));
                    },
                  ),
                  _buildLocaleButton(context, ref),
                  gapW8,
                  const DarkModeSwitch(),
                  gapW8,
                ],
              ),
            ),
        ],
      ),
    );
  }

  void _scrollToTop(BuildContext context, WidgetRef ref) {
    if (Responsive.isDesktop(context)) {
      _onAppBarButtonTap(ref.watch(aboutSectionKeyProvider));
    } else {
      _onAppBarButtonTap(ref.watch(homeSectionKeyProvider));
    }
  }

  void _onAppBarButtonTap(GlobalKey sectionKey) {
    final sectionKeyCurrentContext = sectionKey.currentContext;
    if (sectionKeyCurrentContext != null) {
      Scrollable.ensureVisible(
        sectionKeyCurrentContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
  }

  Widget _buildLocaleButton(BuildContext context, WidgetRef ref) {
    final languages = ref.watch(languageRepositoryProvider).getLanguages();
    if (languages.length > 1) return const LocaleButton();
    return const SizedBox.shrink();
  }
}
