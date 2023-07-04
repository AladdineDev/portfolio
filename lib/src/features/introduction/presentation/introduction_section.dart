import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/introduction/presentation/introduction_desktop.dart';
import 'package:portfolio/src/features/introduction/presentation/introduction_mobile.dart';
import 'package:portfolio/src/features/introduction/presentation/introduction_tablet.dart';
import 'package:portfolio/src/common_widgets/responsive.dart';

class IntroductionSection extends ConsumerWidget {
  const IntroductionSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Responsive(
      mobile: IntroductionMobile(),
      tablet: IntroductionTablet(),
      desktop: IntroductionDesktop(),
    );
  }
}
