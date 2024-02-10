import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/domain/technology.dart';
import 'package:portfolio/src/common/widgets/technology_chip.dart';

class TechnologyWrapChips extends ConsumerWidget {
  const TechnologyWrapChips({
    super.key,
    required this.technologies,
  });

  final List<Technology> technologies;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: technologies.map((technology) {
        return TechnologyChip(technology: technology);
      }).toList(),
    );
  }
}
