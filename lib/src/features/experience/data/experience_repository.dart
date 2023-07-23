import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:portfolio/src/localization/localization_provider.dart';
import 'package:portfolio/src/localization/localized_date.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_repository.g.dart';

@riverpod
ExperienceRepository experienceRepository(ExperienceRepositoryRef ref) {
  return ExperienceRepository(ref);
}

class ExperienceRepository {
  ExperienceRepository(this._ref);
  final AutoDisposeRef _ref;

  List<Experience> fetchExperiences() {
    final locale = _ref.watch(localizationProvider);
    final appLocalizations = _ref.watch(appLocalizationsProvider);
    return [
      Experience(
        startDate: 2022.localizedYear(locale),
        endDate: appLocalizations.resumePresent,
        job: appLocalizations.mobileDevJobTitle,
        company: "Walt Disney Imagineering",
        description: appLocalizations.wdiJobDescription,
        technologies: [
          "Flutter",
          "Dart",
          "Django",
          "Python",
          "PostgreSQL",
          "SQLite",
          "Docker"
        ],
      ),
      Experience(
        startDate:
            "${appLocalizations.januaryAbreviation} ${2022.localizedYear(locale)}",
        endDate:
            "${appLocalizations.februaryAbreviation} ${2022.localizedYear(locale)}",
        job: appLocalizations.mobileWebDevJobTitle,
        company: "Solutions Multi Techniques",
        description: appLocalizations.smtJobDescription,
        technologies: ["Flutter", "Dart", "Firebase"],
      ),
      Experience(
        startDate:
            "${appLocalizations.mayAbreviation} ${2021.localizedYear(locale)}",
        endDate:
            "${appLocalizations.juneAbreviation} ${2021.localizedYear(locale)}",
        job: appLocalizations.webDevJobTitle,
        company: "Association FAIRE",
        description: appLocalizations.faireJobDescription,
        url: "https://www.association-faire.fr",
        technologies: [
          "HTML",
          "CSS",
          "Javascript",
          "PHP",
          "MariaDB",
          "Apache",
          "Figma",
        ],
      ),
    ];
  }
}
