import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/resume_alert_dialog.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';

class ResumeButton extends ConsumerWidget {
  const ResumeButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        side: BorderSide(
          width: 2,
          color: Theme.of(context).colorScheme.tertiary,
        ),
        elevation: 16,
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 12),
      ),
      onPressed: () => _onPressed(context),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Icon(
            FontAwesomeIcons.filePdf,
            color: Theme.of(context).colorScheme.inverseSurface,
          ),
          gapW12,
          Text(
            context.localized.resume,
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  void _onPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const ResumeAlertDialog(),
    );
  }
}
