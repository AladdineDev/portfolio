import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ImageNetworkOrAsset extends ConsumerWidget {
  const ImageNetworkOrAsset(
    this.src, {
    super.key,
    this.fit = BoxFit.cover,
    this.cacheWidth = 1920,
  });

  final String src;
  final BoxFit fit;
  final int cacheWidth;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (src.startsWith("assets/")) {
      // Load image from a network
      return Image.asset(
        src,
        fit: fit,
        cacheWidth: cacheWidth,
        errorBuilder: (_, __, ___) => const Placeholder(),
      );
    } else if (src.startsWith(RegExp(r'^https?://'))) {
      // Load image from assets
      return Image.network(
        src,
        fit: fit,
        cacheWidth: cacheWidth,
        errorBuilder: (_, __, ___) => const Placeholder(),
      );
    } else {
      return const Placeholder();
    }
  }
}
