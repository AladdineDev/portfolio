import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/domain/icon.dart';

class MyIcon extends ConsumerWidget {
  const MyIcon({
    super.key,
    this.icon,
    this.placeholder = const SizedBox.shrink(),
    this.color,
    this.size,
  });

  final IconModel? icon;
  final Color? color;
  final double? size;
  final Widget placeholder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final color = this.color ??
        Theme.of(context).iconTheme.color ??
        Theme.of(context).colorScheme.tertiary;
    final iconAssetName = icon?.iconAssetName;
    final iconCodePoint = icon?.iconCodePoint;
    final iconFontFamily = icon?.iconFontFamily;
    final iconFontPackage = icon?.iconFontPackage;
    if (iconCodePoint != null &&
        iconFontFamily != null &&
        iconFontPackage != null) {
      final iconCodePointHexa = int.tryParse(iconCodePoint);
      if (iconCodePointHexa != null) {
        final iconData = IconData(
          iconCodePointHexa,
          fontFamily: iconFontFamily,
          fontPackage: iconFontPackage,
        );
        return Icon(
          color: color,
          size: size,
          iconData,
        );
      }
    } else if (iconAssetName != null && iconFontPackage != null) {
      return SvgPicture.asset(
        iconAssetName,
        package: iconFontPackage,
        width: 32,
        theme: SvgTheme(
          currentColor: color,
        ),
      );
    }
    return placeholder;
  }
}
