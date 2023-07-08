import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyDrawerButton extends ConsumerStatefulWidget {
  const MyDrawerButton({
    super.key,
    required this.title,
    required this.sectionKey,
  });

  final String title;
  final GlobalKey sectionKey;

  @override
  ConsumerState<MyDrawerButton> createState() => MyDrawerButtonsState();
}

class MyDrawerButtonsState extends ConsumerState<MyDrawerButton> {
  TextStyle? titleStyle;

  @override
  void didChangeDependencies() {
    titleStyle = Theme.of(context).textTheme.headlineMedium;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onHover: (_) {
        setState(() {
          titleStyle = Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Theme.of(context).colorScheme.onSecondary,
              );
        });
      },
      onExit: (_) {
        setState(() {
          titleStyle = Theme.of(context).textTheme.headlineMedium;
        });
      },
      child: GestureDetector(
        onTap: () => _onTap(context),
        child: Text(
          widget.title,
          style: titleStyle,
        ),
      ),
    );
  }

  void _onTap(BuildContext context) {
    if (widget.sectionKey.currentContext != null) {
      Scrollable.ensureVisible(
        widget.sectionKey.currentContext!,
        duration: const Duration(milliseconds: 500),
        curve: Curves.decelerate,
      );
    }
    Navigator.of(context).pop();
  }
}
