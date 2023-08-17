import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MagicIcon extends ConsumerWidget {
  const MagicIcon({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      FontAwesomeIcons.wandMagicSparkles,
      color: Theme.of(context).colorScheme.inverseSurface,
    );
  }
}
