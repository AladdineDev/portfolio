import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

import 'package:url_launcher/url_launcher.dart';

class Link extends ConsumerStatefulWidget {
  const Link({
    super.key,
    required this.url,
    this.displayLink,
    this.displayLeadingIcon = false,
    this.underlined = false,
    this.hoverColor,
  });

  final String url;
  final String? displayLink;
  final bool displayLeadingIcon;
  final bool underlined;
  final Color? hoverColor;

  @override
  ConsumerState<Link> createState() => _LinksState();
}

class _LinksState extends ConsumerState<Link> {
  TextStyle? _linkStyle;

  @override
  void didChangeDependencies() {
    _linkStyle = TextStyle(
      decoration: widget.underlined ? TextDecoration.underline : null,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        setState(() {
          _linkStyle = TextStyle(
            decoration: widget.underlined ? TextDecoration.underline : null,
            color: widget.hoverColor ?? Colors.blue,
          );
        });
      },
      onExit: (_) {
        setState(() {
          _linkStyle = TextStyle(
            decoration: widget.underlined ? TextDecoration.underline : null,
          );
        });
      },
      child: GestureDetector(
        onTap: () async {
          if (!await launchUrl(Uri.parse(widget.url))) {
            if (!mounted) return;
            final snackBar = SnackBar(
              content: Text("${LocaleKeys.openUrlError.tr()} ${widget.url}"),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.displayLeadingIcon)
              Row(
                children: [
                  Icon(
                    Icons.link,
                    color: _linkStyle?.color,
                  ),
                  gapW4,
                ],
              ),
            Flexible(
              child: Text(
                widget.displayLink ?? widget.url,
                style: _linkStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
