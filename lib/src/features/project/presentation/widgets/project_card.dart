import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/features/project/presentation/widgets/project_description.dart';
import 'package:portfolio/src/features/project/presentation/widgets/project_image.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';
import 'package:portfolio/src/utils/launch_url_helper.dart';
import 'package:portfolio/src/utils/scaffold_messenger_helper.dart';

class ProjectCard extends ConsumerStatefulWidget {
  const ProjectCard({super.key, required this.project});

  final Project project;

  @override
  ConsumerState<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends ConsumerState<ProjectCard> {
  bool _isHovered = false;
  void _scaleUp() => setState(() => _isHovered = true);
  void _scaleDown() => setState(() => _isHovered = false);
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => _scaleUp(),
      onExit: (_) => _scaleDown(),
      child: GestureDetector(
        onLongPress: _scaleUp,
        onLongPressUp: _scaleDown,
        child: Material(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20),
          child: InkWell(
            onTap: () => _onTap(context: context),
            borderRadius: BorderRadius.circular(20),
            hoverColor: Theme.of(context).colorScheme.tertiary.withAlpha(40),
            splashColor: Theme.of(context).colorScheme.tertiary.withAlpha(30),
            highlightColor:
                Theme.of(context).colorScheme.tertiary.withAlpha(20),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: _buildResponsiveProjectCardContent(context),
            ),
          ),
        ),
      ),
    );
  }

  void _onTap({required BuildContext context}) async {
    final url = widget.project.url;
    if (url == null) return;
    try {
      await LaunchUrlHelper.launchURL(url);
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessengerHelper.showLaunchUrlError(context, url: url);
      }
    }
  }

  Widget _buildResponsiveProjectCardContent(BuildContext context) {
    if (!Responsive.isTablet(context)) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProjectImage(project: widget.project, isHovered: _isHovered),
          gapH8,
          ProjectDescription(project: widget.project),
        ],
      );
    }
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 7,
          child: ProjectImage(project: widget.project, isHovered: _isHovered),
        ),
        gapW12,
        Expanded(
          flex: 10,
          child: ProjectDescription(project: widget.project),
        ),
      ],
    );
  }
}
