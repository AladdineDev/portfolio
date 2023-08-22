import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/personal_info/domain/resume.dart';
import 'package:portfolio/src/features/personal_info/presentation/widgets/resume_language_dialog.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';

import 'package:url_launcher/url_launcher.dart';

class ResumeButton extends ConsumerWidget {
  const ResumeButton({super.key, required this.resumes});

  final List<Resume> resumes;

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
            tr(LocaleKeys.resume),
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Future<void> _onPressed(BuildContext context, WidgetRef ref) async {
    if (resumes.length > 1) {
      showAdaptiveDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) => ResumeLanguageDialog(resumes: resumes),
      );
    } else if (resumes.length == 1) {
      final resumeFirstUrl = resumes.first.url;
      if (resumeFirstUrl == null) {
        _showSnackBarResumeError(context);
        return;
      }
      await launchUrl(Uri.parse(resumeFirstUrl));
      if (context.mounted) {
        Navigator.of(context).pop();
      }
    } else {
      _showSnackBarResumeError(context);
    }
  }

  void _showSnackBarResumeError(BuildContext context) {
    final snackBar = SnackBar(
      content: Text(tr(LocaleKeys.openResumeError)),
    );
    if (context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
