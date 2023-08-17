import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/main/provider/dark_mode_controller.dart';

class FavoriteIcon extends ConsumerWidget {
  const FavoriteIcon({super.key});

  static const _lightBlue = Color(0xff13b9fd);
  static const _darkBlue = Color(0xff0175c2);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      Icons.favorite,
      color: ref.watch(darkModeProvider).maybeWhen(
            data: (darkMode) => darkMode ? _lightBlue : _darkBlue,
            orElse: () => _darkBlue,
          ),
    );
  }
}
