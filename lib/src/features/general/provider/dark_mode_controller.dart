import 'dart:ui';

import 'package:portfolio/src/features/general/provider/brightness_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_controller.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  @override
  FutureOr<bool> build() async {
    final brightness = await ref.watch(brightnessControllerProvider.future);
    return brightness == Brightness.dark;
  }

  Future<void> updateTheme() async {
    await ref.watch(brightnessControllerProvider.notifier).updateBrightness();
  }
}
