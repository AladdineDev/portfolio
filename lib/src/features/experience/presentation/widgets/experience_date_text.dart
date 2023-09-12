import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/utils/localized_date_extension.dart';
import 'package:portfolio/src/utils/string_extension.dart';

class ExperienceDateText extends ConsumerWidget {
  const ExperienceDateText({super.key, required this.experience});

  final Experience experience;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locale = context.locale;
    final startMonth = experience.startMonth?.localizedMonth(locale) ?? "";
    final startYear = experience.startYear?.localizedYear(locale);
    final startDate = startMonth.isEmpty ? startYear : "$startMonth $startYear";
    final endMonth = experience.endMonth?.localizedMonth(locale) ?? "";
    final endYear = experience.endYear?.localizedYear(locale);
    String? endDate;
    if (experience.isPresent == true) {
      endDate = tr(LocaleKeys.present);
    } else {
      endDate = endMonth.isEmpty ? endYear : "$endMonth $endYear";
    }
    if (startDate == null || endDate == null) return const Text("");
    return Text(
      "${startDate.capitalize()} - ${endDate.capitalize()}",
      style: Theme.of(context).textTheme.bodyMedium,
    );
  }
}
