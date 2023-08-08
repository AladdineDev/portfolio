import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:portfolio/src/common_widgets/link.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

class BottomBanner extends ConsumerWidget {
  const BottomBanner({super.key, this.bannerHeight = 48});

  final double bannerHeight;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      width: double.maxFinite,
      height: bannerHeight,
      color: Theme.of(context).colorScheme.secondary,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${tr(LocaleKeys.credit_message)} ",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          DefaultTextStyle(
            style: Theme.of(context).textTheme.bodyLarge!,
            child: Link(
              url: tr(LocaleKeys.credit_url),
              displayLink: tr(LocaleKeys.credit_to),
              underlined: true,
              hoverColor: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ],
      ),
    );
  }
}
