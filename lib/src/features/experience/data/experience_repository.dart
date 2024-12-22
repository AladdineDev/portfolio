import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';
import 'package:portfolio/src/localization/locale_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experience_repository.g.dart';

@riverpod
ExperienceRepository experienceRepository(Ref ref) {
  return ExperienceRepository(ref);
}

class ExperienceRepository {
  ExperienceRepository(this._ref);

  final Ref _ref;

  List<Experience> getExperiences() {
    final locale = _ref.watch(localeControllerProvider).requireValue.locale;
    final jsonExperiences = trList(locale, LocaleKeys.experiences);
    final experiences = jsonExperiences.map((jsonExperience) {
      return Experience.fromJson(jsonExperience);
    }).toList();
    return experiences;
  }
}
