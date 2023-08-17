import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:portfolio/src/features/introduction/domain/contact.dart';
import 'package:portfolio/src/features/introduction/domain/resume.dart';
import 'package:portfolio/src/localization/generated/locale_keys.g.dart';
import 'package:portfolio/src/localization/json_list_translation.dart';
import 'package:portfolio/src/localization/locale_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'introduction_repository.g.dart';

@riverpod
IntroductionRepository introductionRepository(IntroductionRepositoryRef ref) {
  return IntroductionRepository(ref);
}

class IntroductionRepository {
  IntroductionRepository(this._ref);

  final Ref _ref;

  List<Resume> getResumes() {
    final locale = _ref.watch(localeControllerProvider).locale;
    final jsonResumes = trList(locale, LocaleKeys.resumes);
    final resumes = jsonResumes.map((jsonResume) {
      return Resume.fromJson(jsonResume);
    }).toList();
    return resumes;
  }

  List<Contact> getContacts() {
    final locale = _ref.watch(localeControllerProvider).locale;
    final jsonContacts = trList(locale, LocaleKeys.contacts);
    final contacts = jsonContacts.map((jsonContact) {
      return Contact.fromJson(jsonContact);
    }).toList();
    return contacts;
  }
}
