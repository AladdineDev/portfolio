import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/main/provider/dark_mode_controller.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wb_sunny_outlined),
        Switch(
          value: _getDarkMode(ref),
          onChanged: (_) {
            ref.read(darkModeProvider.notifier).updateTheme();
          },
        ),
        Icon(_getDarkMode(ref) ? Icons.mode_night : Icons.mode_night_outlined),
      ],
    );
  }

  bool _getDarkMode(WidgetRef ref) {
    return ref.watch(darkModeProvider).maybeWhen(
          data: (darkMode) => darkMode,
          orElse: () => ThemeMode.system == ThemeMode.dark,
        );
  }
}
