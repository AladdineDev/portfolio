import 'package:flutter/material.dart';

class TechnologyChip extends StatelessWidget {
  const TechnologyChip({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        name,
        style: Theme.of(context).textTheme.bodySmall,
      ),
    );
  }
}
