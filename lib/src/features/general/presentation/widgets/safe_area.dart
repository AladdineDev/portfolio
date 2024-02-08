import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MySafeArea extends ConsumerWidget {
  const MySafeArea({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      left: false,
      right: false,
      bottom: false,
      child: child,
    );
  }
}
