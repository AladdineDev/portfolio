import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';

class MyLink extends StatefulHookConsumerWidget {
  const MyLink({
    super.key,
    required this.url,
    this.displayLink,
    this.displayLeadingIcon = false,
    this.underlined = false,
    this.hoverColor = Colors.blue,
  });

  final String url;
  final String? displayLink;
  final bool displayLeadingIcon;
  final bool underlined;
  final Color hoverColor;

  @override
  ConsumerState<MyLink> createState() => _LinkState();
}

class _LinkState extends ConsumerState<MyLink> {
  late ColorTween _colorTween;

  @override
  void didChangeDependencies() {
    _colorTween = ColorTween(
      begin: Theme.of(context).colorScheme.inverseSurface,
      end: widget.hoverColor,
    );
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final isHovered = useState(false);
    final controller = useAnimationController(
      duration: const Duration(milliseconds: 200),
    );
    final colorAnimation = useAnimation(_colorTween.animate(controller));

    return DefaultSelectionStyle(
      selectionColor: Theme.of(context).colorScheme.tertiary,
      mouseCursor: MouseCursor.defer,
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) {
          if (!isHovered.value) {
            isHovered.value = true;
            controller.forward();
          }
        },
        onExit: (_) {
          if (isHovered.value) {
            isHovered.value = false;
            controller.reverse();
          }
        },
        child: GestureDetector(
          onTap: () => _onTap(context),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.displayLeadingIcon)
                Row(
                  children: [
                    Icon(
                      Icons.link,
                      color: colorAnimation,
                    ),
                    gapW4,
                  ],
                ),
              Flexible(
                child: Text(
                  widget.displayLink ?? widget.url,
                  style: TextStyle(
                    decoration:
                        widget.underlined ? TextDecoration.underline : null,
                    color: colorAnimation,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) async {
    try {
      await LaunchUrlHelper.launchURL(widget.url);
    } catch (e) {
      if (!context.mounted) return;
      ScaffoldMessengerHelper.showLaunchUrlError(context, url: widget.url);
    }
  }
}
