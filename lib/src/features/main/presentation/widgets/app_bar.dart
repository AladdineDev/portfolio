import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/main/presentation/widgets/app_bar_button.dart';
import 'package:portfolio/src/features/main/presentation/widgets/dark_mode_switch.dart';
import 'package:portfolio/src/features/main/presentation/widgets/locale_button.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';
import 'package:portfolio/src/features/main/presentation/provider/section_key_provider.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';

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
      title: const Row(
        children: [
          Icon(FontAwesomeIcons.terminal),
          SizedBox(width: 12),
          Text("Portfolio"),
        ],
      ),
      actions: [
        if (Responsive.isDesktop(context))
          Row(
            children: [
              AppBarButton(
                title: context.localized.aboutSectionTitle,
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
                title: context.localized.experienceSectionTitle,
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
                title: context.localized.projectsSectionTitle,
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
              const LocaleButton(),
              gapW8,
              const DarkModeSwitch(),
              gapW8,
            ],
          ),
      ],
    );
  }
}
