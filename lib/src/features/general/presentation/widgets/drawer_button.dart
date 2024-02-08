import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MyDrawerButton extends StatefulHookConsumerWidget {
  const MyDrawerButton({
    super.key,
    required this.title,
    required this.sectionKey,
  });

  final String title;
  final GlobalKey sectionKey;

  @override
  ConsumerState<MyDrawerButton> createState() => _MyDrawerButtonState();
}

class _MyDrawerButtonState extends ConsumerState<MyDrawerButton> {
  late ColorTween _colorTween;

  @override
  void didChangeDependencies() {
    _colorTween = ColorTween(
      begin: Theme.of(context).colorScheme.inverseSurface,
      end: Theme.of(context).colorScheme.onSecondary,
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

    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
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
          child: Text(
            widget.title,
            style: TextStyle(color: colorAnimation),
          ),
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    final sectionKeyCurrentContext = widget.sectionKey.currentContext;
    if (sectionKeyCurrentContext != null) {
      Scrollable.ensureVisible(
        sectionKeyCurrentContext,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
    Navigator.of(context).pop();
  }
}
