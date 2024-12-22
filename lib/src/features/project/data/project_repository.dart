import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';
import 'package:portfolio/src/localization/locale_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'project_repository.g.dart';

@riverpod
ProjectRepository projectRepository(Ref ref) {
  return ProjectRepository(ref);
}

class ProjectRepository {
  ProjectRepository(this._ref);

  final Ref _ref;

  List<Project> getProjects() {
    final locale = _ref.watch(localeControllerProvider).requireValue.locale;
    final jsonProjects = trList(locale, LocaleKeys.projects);
    final projects = jsonProjects.map((jsonProject) {
      return Project.fromJson(jsonProject);
    }).toList();
    return projects;
  }
}
