import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/project/presentation/project_desktop.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';

class ProjectSection extends ConsumerWidget {
  const ProjectSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(
      desktop: ProjectDesktop(),
    );
  }
}
