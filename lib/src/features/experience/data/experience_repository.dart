import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_repository.g.dart';

@riverpod
ExperienceRepository experienceRepository(ExperienceRepositoryRef ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ExperienceRepository(appLocalizations);
}

class ExperienceRepository {
  ExperienceRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Experience> fetchExperiences() {
    return [
      Experience(
        startDate: "2022",
        endDate: _appLocalizations.resumePresent,
        job: _appLocalizations.mobileDevJobTitle,
        company: "Walt Disney Imagineering",
        description: _appLocalizations.wdiJobDescription,
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
        startDate: "Jan. 2022",
        endDate: "Feb. 2022",
        job: _appLocalizations.mobileWebDevJobTitle,
        company: "Solutions Multi Techniques",
        description: _appLocalizations.smtJobDescription,
        technologies: ["Flutter", "Dart", "Firebase"],
      ),
      Experience(
        startDate: "May 2021",
        endDate: "June 2021",
        job: _appLocalizations.webDevJobTitle,
        company: "Association FAIRE",
        description: _appLocalizations.faireJobDescription,
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
