import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/general/presentation/general_section_desktop.dart';
import 'package:portfolio/src/features/general/presentation/general_section_tablet.dart';
import 'package:portfolio/src/features/general/presentation/widgets/bottom_banner.dart';
import 'package:portfolio/src/features/general/presentation/widgets/end_drawer.dart';
import 'package:portfolio/src/features/general/presentation/widgets/safe_area.dart';
import 'package:portfolio/src/common/widgets/responsive.dart';

class GeneralSection extends ConsumerWidget {
  const GeneralSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      endDrawer: const MySafeArea(
        child: EndDrawer(),
      ),
      body: const MySafeArea(
        child: Stack(
          children: [
            Responsive(
              desktop: GeneralDesktop(),
              tablet: GeneralTablet(),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: BottomBanner(),
            )
          ],
        ),
      ),
    );
  }
}
