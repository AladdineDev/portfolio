import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/main/presentation/widgets/app_bar_button.dart';
import 'package:portfolio/src/features/main/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/main/presentation/widgets/locale_button.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/features/main/provider/section_key_provider.dart';
import 'package:portfolio/src/shared/widgets/responsive.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';

class MyAppBar extends ConsumerWidget {
  const MyAppBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      centerTitle: false,
      titleTextStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
          ),
      title: Row(
        children: [
          const Icon(FontAwesomeIcons.terminal),
          const SizedBox(width: 12),
          Text(tr(LocaleKeys.portfolio)),
        ],
      ),
      actions: [
        if (Responsive.isDesktop(context))
          Row(
            children: [
              AppBarButton(
                title: tr(LocaleKeys.aboutSectionTitle),
                onPressed: () {
                  final aboutSectionKey = ref.watch(aboutSectionKeyProvider);
                  if (aboutSectionKey.currentContext != null) {
                    Scrollable.ensureVisible(
                      aboutSectionKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  }
                },
              ),
              AppBarButton(
                title: tr(LocaleKeys.experienceSectionTitle),
                onPressed: () {
                  final experienceSectionKey =
                      ref.watch(experienceSectionKeyProvider);
                  if (experienceSectionKey.currentContext != null) {
                    Scrollable.ensureVisible(
                      experienceSectionKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  }
                },
              ),
              AppBarButton(
                title: tr(LocaleKeys.projectsSectionTitle),
                onPressed: () {
                  final projectSectionKey =
                      ref.watch(projectSectionKeyProvider);
                  if (projectSectionKey.currentContext != null) {
                    Scrollable.ensureVisible(
                      projectSectionKey.currentContext!,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.decelerate,
                    );
                  }
                },
              ),
              _buildLocaleButton(context),
              gapW8,
              const DarkModeSwitch(),
              gapW8,
            ],
          ),
      ],
    );
  }

  Widget _buildLocaleButton(BuildContext context) {
    final jsonLanguages = trList(context.locale, LocaleKeys.languages);
    if (jsonLanguages.length > 1) {
      return const LocaleButton();
    }
    return const SizedBox.shrink();
  }
}
