import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/introduction/data/resume_repository.dart';
import 'package:portfolio/src/localization/localized_build_context.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeAlertDialog extends ConsumerWidget {
  const ResumeAlertDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SimpleDialog(
      title: Center(
        child: Text(context.localized.downloadResume),
      ),
      titlePadding: const EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0),
      contentPadding: const EdgeInsets.fromLTRB(0.0, 12.0, 0.0, 40.0),
      children: [
        const Divider(height: 0),
        InkWell(
          onTap: () => _onPressed(context, ref, const Locale("en")),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "English",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 0),
        InkWell(
          onTap: () => _onPressed(context, ref, const Locale("fr")),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Text(
                  "Français",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ],
          ),
        ),
        const Divider(height: 0),
      ],
    );
  }

  void _onPressed(BuildContext context, WidgetRef ref, Locale locale) async {
    final resumeRepository = ref.read(resumeRepositoryProvider);
    try {
      final resumeUrl = await resumeRepository.getResumeUrl(locale);
      await launchUrl(Uri.parse(resumeUrl));
    } catch (e) {
      const snackBar = SnackBar(
        content: Text("Could not open resume"),
      );
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
