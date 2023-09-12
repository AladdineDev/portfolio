import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/widgets/technology_chip.dart';

class TechnologyWrapChips extends ConsumerWidget {
  const TechnologyWrapChips({
    super.key,
    required this.titles,
  });

  final List<String> titles;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: titles.map((technology) {
        return TechnologyChip(name: technology);
      }).toList(),
    );
  }
}
