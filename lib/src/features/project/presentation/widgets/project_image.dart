import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/project/domain/project.dart';

class ProjectImage extends ConsumerWidget {
  const ProjectImage({
    super.key,
    required this.project,
    required this.isHovered,
  });

  final Project project;
  final bool isHovered;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    IconData? iconData;
    final projectIconCodePoint = project.iconCodePoint;
    final projectIconFontFamily = project.iconFontFamily;
    final projectIconFontPackage = project.iconFontPackage;
    if (projectIconCodePoint != null && projectIconFontFamily != null) {
      final projectIconCodePointHexa = int.tryParse(projectIconCodePoint);
      if (projectIconCodePointHexa != null) {
        iconData = IconData(
          projectIconCodePointHexa,
          fontFamily: projectIconFontFamily,
          fontPackage: projectIconFontPackage,
        );
      }
    }
    return Stack(
      children: [
        Container(
          constraints: const BoxConstraints(
            minHeight: 200,
            minWidth: 520,
            maxHeight: 400,
            maxWidth: 520,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              width: 4,
              color: Theme.of(context).colorScheme.tertiary.withAlpha(100),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LayoutBuilder(
              builder: (context, constraints) {
                final width = constraints.maxWidth;
                final screenshotUrl = project.screenshotUrl;
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
                  child: screenshotUrl == null
                      ? const Icon(Icons.code)
                      : Image.network(
                          screenshotUrl,
                          fit: BoxFit.cover,
                          cacheWidth: 1920,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress != null) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return child;
                          },
                        ),
                );
              },
            ),
          ),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: SizedBox.square(
            dimension: 32,
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
              secondChild: iconData == null
                  ? const SizedBox.shrink()
                  : Icon(
                      iconData,
                      color: Colors.white,
                      size: 32,
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
