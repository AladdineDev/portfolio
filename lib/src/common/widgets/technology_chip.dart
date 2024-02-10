import 'package:flutter/material.dart';
import 'package:portfolio/src/common/domain/technology.dart';
import 'package:portfolio/src/common/widgets/icon.dart';
import 'package:portfolio/src/constants/sizes.dart';

class TechnologyChip extends StatelessWidget {
  const TechnologyChip({super.key, required this.technology});

  final Technology technology;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(32)),
      ),
      height: 32,
      child: _buildTechnologyChip(context: context, technology: technology),
    );
  }

  Widget? _buildTechnologyChip({
    required BuildContext context,
    required Technology technology,
  }) {
    final technologyName = technology.name;
    final technologyIcon = technology.icon;
    if (technologyName == null) return null;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (technologyIcon == null)
          gapW4
        else
          Padding(
            padding: const EdgeInsets.fromLTRB(2, 4, 4, 4),
            child: MyIcon(
              icon: technologyIcon,
              size: 32,
            ),
          ),
        Text(
          technologyName,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        gapW4
      ],
    );
  }
}
