import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/introduction/domain/resume.dart';
import 'package:url_launcher/url_launcher.dart';

class ResumeLanguageDialogTile extends ConsumerWidget {
  const ResumeLanguageDialogTile({super.key, required this.resume});
  final Resume resume;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () => _onPressed(context, resumeUrl: resume.url),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Text(
              resume.language,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
        ],
      ),
    );
  }
}

void _onPressed(BuildContext context, {required String resumeUrl}) async {
  try {
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
