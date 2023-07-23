import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_repository.g.dart';

@riverpod
ProjectRepository projectRepository(ProjectRepositoryRef ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ProjectRepository(appLocalizations);
}

class ProjectRepository {
  ProjectRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Project> fetchProjects() {
    return [
      Project(
        title: "Portfolio",
        description: _appLocalizations.portfolioDescription,
        technologies: ["Flutter", "Dart", "Firebase"],
        url: "https://github.com/Aaldn/portfolio#readme",
        photoUrl:
            "https://raw.githubusercontent.com/Aaldn/portfolio/main/assets/screenshots/web-light.png",
      ),
      Project(
        title: "Learn Flow API",
        description: _appLocalizations.learnFlowApiDescription,
        technologies: [
          "Node.js",
          "Express",
          "TypeScript",
          "MongoDB",
          "Docker",
        ],
        url: "https://github.com/Aaldn/learnflow-api#readme",
        photoUrl:
            "https://raw.githubusercontent.com/Aaldn/learnflow-api/main/src/public/screenshots/screenshot.png",
      ),
      Project(
        title: "Learn Flow Backoffice",
        description: _appLocalizations.learnFlowBackOfficeDescription,
        technologies: ["Flutter", "Dart"],
        url: "https://github.com/Aaldn/learnflow_backoffice#readme",
        photoUrl:
            "https://raw.githubusercontent.com/Aaldn/learnflow_backoffice/main/assets/screenshots/screenshot_login.png",
      ),
      Project(
        title: "GSB-Frais",
        description: _appLocalizations.gsbFraisDescription,
        technologies: ["Symfony", "PHP", "Bootstrap", "MariaDB", "Apache"],
        url: "https://github.com/Aaldn/GSB-Frais#readme",
        photoUrl:
            "https://raw.githubusercontent.com/Aaldn/GSB-Frais/master/screenshots/visiteur/0-Second%20Screenshot%20README.png",
      ),
      Project(
        title: "GSB-RV-Visiteur-Serveur",
        description: _appLocalizations.gsbRvVisiteurServeurDescription,
        technologies: ["Flask", "Python", "MariaDB", "Docker"],
        url: "https://github.com/Aaldn/GSB-RV-Visiteur-Serveur#readme",
        photoUrl:
            "https://raw.githubusercontent.com/Aaldn/GSB-RV-Visiteur-Serveur/master/screenshots/RESTClient.png",
      ),
      Project(
        title: "GSB-RV-DR",
        description: _appLocalizations.gsbRvDr,
        technologies: ["JavaFX", "Java", "MariaDB"],
        url: "https://github.com/Aaldn/GSB-RV-DR#readme",
        photoUrl:
            "https://raw.githubusercontent.com/Aaldn/GSB-RV-DR/master/screenshots/9-Consultation%20D%C3%A9taill%C3%A9e%20Rapport.png",
      ),
    ];
  }
}
