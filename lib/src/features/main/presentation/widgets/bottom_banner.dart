import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:portfolio/src/common/widgets/link.dart';
import 'package:portfolio/src/common/widgets/selection_area.dart';
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
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.titleSmall!,
        child: MySelectionArea(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${tr(LocaleKeys.bottomBanner_message)} ",
              ),
              LinkWidget(
                url: tr(LocaleKeys.bottomBanner_linkUrl),
                displayLink: tr(LocaleKeys.bottomBanner_displayLink),
                underlined: true,
                hoverColor: Theme.of(context).colorScheme.onSurface,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
