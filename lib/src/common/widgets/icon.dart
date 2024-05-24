import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/domain/icon.dart';

class MyIcon extends ConsumerWidget {
  const MyIcon({
    super.key,
    this.icon,
    this.placeholder = const SizedBox.shrink(),
    this.size = 24,
    this.padding,
  });

  final IconModel? icon;
  final double? size;
  final Widget placeholder;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final iconAssetName = icon?.assetName;
    final iconCodePoint = icon?.codePoint;
    final iconFontFamily = icon?.fontFamily;
    final iconColor = icon?.color;
    Color? color;
    if (iconColor != null) {
      final colorHex = int.tryParse(iconColor);
      if (colorHex != null) {
        color = Color(colorHex);
      }
    }
    if (iconCodePoint != null && iconFontFamily != null) {
      final iconCodePointHexa = int.tryParse(iconCodePoint);
      if (iconCodePointHexa != null) {
        final iconData = IconData(
          iconCodePointHexa,
          fontFamily: iconFontFamily,
        );
        return Padding(
          padding: const EdgeInsets.all(2),
          child: FittedBox(
            child: Icon(
              iconData,
              color: color,
              size: size,
            ),
          ),
        );
      }
    } else if (iconAssetName != null) {
      return SvgPicture.asset(
        iconAssetName,
        width: size,
        colorFilter:
            color == null ? null : ColorFilter.mode(color, BlendMode.srcIn),
      );
    }
    return placeholder;
  }
}
