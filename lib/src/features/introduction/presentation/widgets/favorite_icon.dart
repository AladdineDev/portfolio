import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/main/presentation/provider/dark_mode_controller.dart';

class FavoriteIcon extends ConsumerWidget {
  const FavoriteIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      Icons.favorite,
      color: ref.watch(darkModeProvider)
          ? const Color(0xff13b9fd)
          : const Color(0xff0175c2),
    );
  }
}
