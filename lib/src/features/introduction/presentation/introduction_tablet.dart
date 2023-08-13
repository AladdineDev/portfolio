import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/constants/sizes.dart';
import 'package:portfolio/src/features/introduction/domain/contact.dart';
import 'package:portfolio/src/features/introduction/domain/resume.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/contact_bar.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/favorite_icon.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/magic_icon.dart';
import 'package:portfolio/src/features/introduction/presentation/widgets/resume_button.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';

class IntroductionTablet extends ConsumerWidget {
  const IntroductionTablet({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final jsonResumes = trList(context.locale, LocaleKeys.resumes);
    final resumes = jsonResumes.map((jsonResume) {
      return Resume.fromJson(jsonResume);
    });
    final jsonContacts = trList(context.locale, LocaleKeys.contacts);
    final contacts = jsonContacts.map((jsonContact) {
      return Contact.fromJson(jsonContact);
    });
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr(LocaleKeys.name),
          style: Theme.of(context).textTheme.displayLarge,
        ),
        gapH4,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${tr(LocaleKeys.description)} ",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const MagicIcon(),
          ],
        ),
        gapH8,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${tr(LocaleKeys.subDescription)} ",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const FavoriteIcon(),
          ],
        ),
        _buildResumeButton(ref, resumes: resumes.toList()),
        gapH8,
        ContactBar(contacts: contacts.toList()),
      ],
    );
  }

  Widget _buildResumeButton(WidgetRef ref, {required List<Resume> resumes}) {
    if (resumes.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 36),
      child: ResumeButton(resumes: resumes),
    );
  }
}
