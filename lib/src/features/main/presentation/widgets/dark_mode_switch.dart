import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/main/presentation/provider/dark_mode_controller.dart';

class DarkModeSwitch extends ConsumerWidget {
  const DarkModeSwitch({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final darkModeEnabled = ref.watch(darkModeProvider);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const Icon(Icons.wb_sunny_outlined),
        Switch(
          value: ref.watch(darkModeProvider),
          onChanged: (_) {
            ref.watch(darkModeProvider.notifier).updateTheme();
          },
        ),
        Icon(darkModeEnabled ? Icons.mode_night : Icons.mode_night_outlined),
      ],
    );
  }
}
