import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySelectionArea extends ConsumerWidget {
  const MySelectionArea({
    super.key,
    required this.child,
    this.mouseCursor = MaterialStateMouseCursor.textable,
  });

  final Widget child;
  final MouseCursor mouseCursor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultSelectionStyle(
      selectionColor: Theme.of(context).colorScheme.tertiary,
      mouseCursor: mouseCursor,
      child: SelectionArea(
        child: child,
      ),
    );
  }
}
