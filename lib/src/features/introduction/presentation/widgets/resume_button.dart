import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/introduction/data/resume_repository.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/resume_language_dialog.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';
import 'package:url_launcher/url_launcher.dart';

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
      onPressed: () => _onPressed(context, ref),
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

  void _onPressed(BuildContext context, WidgetRef ref) async {
    final resumes = ref.watch(resumeRepositoryProvider).fetchLocalizedResumes();
    if (resumes.length > 1) {
      showDialog(
        context: context,
        builder: (context) => ResumeLanguageDialog(resumes: resumes),
      );
    } else if (resumes.length == 1) {
      try {
        await launchUrl(Uri.parse(resumes.first.url));
      } catch (e) {
        final snackBar = SnackBar(
          content: Text(context.localized.openResumeError),
        );
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      }
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      final snackBar = SnackBar(
        content: Text(context.localized.openResumeError),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
