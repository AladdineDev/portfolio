import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/transparent_image.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/common/widgets/icon.dart';

class ProjectImage extends ConsumerWidget {
  const ProjectImage({
    super.key,
    required this.project,
    required this.isHovered,
  });

  final Project project;
  final bool isHovered;

  static const double _iconSize = 36;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 200,
            minWidth: 520,
            maxHeight: 400,
            maxWidth: 600,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              width: 4,
              color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                return AnimatedContainer(
                  foregroundDecoration: BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.decal,
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        isHovered ? Colors.black12 : Colors.transparent,
                        isHovered ? Colors.black26 : Colors.transparent,
                        isHovered ? Colors.black54 : Colors.transparent,
                      ],
                    ),
                  ),
                  duration: const Duration(seconds: 1),
                  curve: Curves.decelerate,
                  transform: isHovered
                      ? (Matrix4.identity()
                        ..translate(0.5 * width, 0.5 * width)
                        ..scale(1.2)
                        ..translate(0.5 * -width, 0.5 * -width))
                      : Matrix4.identity(),
                  child: _buildScreenshotImage(context),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: SizedBox.square(
            dimension: _iconSize,
            child: AnimatedCrossFade(
              alignment: Alignment.center,
              firstCurve: Curves.decelerate,
              secondCurve: Curves.decelerate,
              sizeCurve: Curves.decelerate,
              crossFadeState: isHovered
                  ? CrossFadeState.showSecond
                  : CrossFadeState.showFirst,
              duration: const Duration(seconds: 1),
              reverseDuration: const Duration(milliseconds: 500),
              firstChild: const SizedBox.shrink(),
              secondChild: MyIcon(
                icon: project.icon,
                size: _iconSize,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildScreenshotImage(BuildContext context) {
    final screenshotPath = project.screenshotPath;
    if (screenshotPath == null) return const Icon(Icons.code);
    return FadeInImage(
      placeholder: MemoryImage(transparentImage),
      image: AssetImage(screenshotPath),
      imageErrorBuilder: (_, __, ___) => const Placeholder(),
      fit: BoxFit.cover,
      placeholderFit: BoxFit.cover,
    );
  }
}
