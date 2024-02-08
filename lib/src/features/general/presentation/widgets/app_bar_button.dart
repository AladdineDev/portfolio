import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AppBarButton extends ConsumerWidget {
  const AppBarButton({super.key, this.onPressed, required this.title});

  final VoidCallback? onPressed;
  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialButton(
      hoverColor: Theme.of(context).colorScheme.primary,
      splashColor: Theme.of(context).colorScheme.tertiary,
      shape: const Border(),
      onPressed: onPressed,
      child: SizedBox(
        height: kToolbarHeight,
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
  }
}
