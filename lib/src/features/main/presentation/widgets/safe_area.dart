import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
