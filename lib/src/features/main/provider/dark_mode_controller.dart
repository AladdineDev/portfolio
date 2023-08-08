import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'dark_mode_controller.g.dart';

@riverpod
class DarkMode extends _$DarkMode {
  @override
  bool build() => true;

  void updateTheme() => state = !state;
}
