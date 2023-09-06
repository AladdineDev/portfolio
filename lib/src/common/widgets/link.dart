import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';

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
    return DefaultSelectionStyle(
      selectionColor: Theme.of(context).colorScheme.tertiary,
      mouseCursor: MouseCursor.defer,
      child: MouseRegion(
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
            try {
              await LaunchUrlHelper.launchURL(widget.url);
            } catch (e) {
              if (!mounted) return;
              ScaffoldMessengerHelper.showLaunchUrlError(
                context,
                url: widget.url,
              );
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
      ),
    );
  }
}
