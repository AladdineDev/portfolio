import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProjectIcon extends ConsumerWidget {
  const ProjectIcon({super.key, required this.iconData});

  final IconData iconData;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Icon(
      color: Colors.white,
      size: 32,
      iconData,
    );
  }
}
