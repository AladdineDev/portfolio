import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/features/introduction/domain/resume.dart';
import 'package:portfolio/src/localization/app_localizations_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'resume_repository.g.dart';

@riverpod
ResumeRepository resumeRepository(ResumeRepositoryRef ref) {
  final appLocalizations = ref.watch(appLocalizationsProvider);
  return ResumeRepository(appLocalizations);
}

class ResumeRepository {
  ResumeRepository(this._appLocalizations);

  final AppLocalizations _appLocalizations;

  List<Resume> fetchLocalizedResumes() {
    return [
      Resume(
        language: _appLocalizations.englishLanguage,
        url:
            'https://drive.google.com/file/d/1b1DgHigJoYxaww5gp74FzpcnB0V8ohMb/view?usp=sharing',
      ),
      // Resume(
      //   language: _appLocalizations.frenchLanguage,
      //   url:
      //       'https://drive.google.com/file/d/13t62MynE9GavlyrtHNM1ShdkdJT0bc0B/view?usp=sharing',
      // ),
    ];
  }
}
