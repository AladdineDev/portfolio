import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/common/domain/link.dart';
import 'package:portfolio/src/common/widgets/link.dart';

class WrapLinks extends ConsumerWidget {
  const WrapLinks({
    super.key,
    required this.links,
  });

  final List<Link> links;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Wrap(
      spacing: 16,
      runSpacing: 4,
      children: links.where((link) => link.url != null).map((link) {
        final projectLinkUrl = link.url;
        final projectLinkDisplay = link.display;
        if (projectLinkUrl == null) return const SizedBox.shrink();
        return MyLink(
          url: projectLinkUrl,
          displayLink: projectLinkDisplay ?? projectLinkUrl,
          displayLeadingIcon: true,
        );
      }).toList(),
    );
  }
}
