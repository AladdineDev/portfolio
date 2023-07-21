import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/features/experience/domain/experience.dart';
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
      const Experience(
        startDate: 'Apr 2022',
        endDate: 'Present',
        job: 'Flutter Developer',
        company: 'Better Than That',
        description:
            'Development of a financial advisory and management system that '
            'empowers users to take charge of their finances. The system lets '
            'users add their bank accounts and then provides a sophisticated '
            'analysis of their cash flow as well as categorizes their transactions. '
            'The system decentralizes all data and does not store any user data.',
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'REST',
          'WebSocket',
          'SumSub',
          'Firebase',
          'Web3',
        ],
      ),
      const Experience(
          startDate: 'May 2022',
          endDate: 'July 2023',
          job: 'Flutter Developer',
          company: 'Dota Hub Limited',
          description:
              'I developed an app that connect vendors directly to buyers, '
              'by using the buyer\'s location to find only close-by vendors. The '
              'app allows vendors to promote products, analyze sales at various '
              'locations with robust statistical data, and many more.',
          technologies: [
            'Flutter',
            'Dart',
            'Android',
            'iOS',
            'REST',
            'Google Places',
            'Google SignIn',
          ],
          url: 'https://beereapp.com'),
      const Experience(
          startDate: 'Jan 2023',
          endDate: 'June 2023',
          job: 'Flutter Developer',
          company: 'Twinku',
          description: 'Twinku is a solution that simplifies the process '
              'for beneficiaries to access properties in case of owner’s '
              'demise.\n I, with other developers worked on building an '
              'app that lets users sync their financial assets (bank, fintech and '
              'crypto accounts), add items to vaults, verify proof of life and many more.',
          technologies: [
            'Flutter',
            'Dart',
            'Android',
            'iOS',
            'GRAPHQL',
            'Firebase',
            'PayStack',
            'AppsFlyer',
          ],
          url: 'https://twinku.co'),
      const Experience(
        startDate: 'Feb 2020',
        endDate: 'Dec 2022',
        job: 'Flutter Developer',
        company: 'Monarch Technologies',
        description: 'At Monarch Technologies, I contributed to building '
            'and managing application systems for enterprises, including '
            'power distribution companies. I managed and upgraded legacy '
            'codebase to run on latest Flutter SDK with sound null safety.',
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'REST',
          'SQFLITE',
        ],
      ),
      const Experience(
        startDate: 'Feb 2019',
        endDate: 'Jun 2022',
        job: 'Mobile App Developer (Flutter & Native Android)',
        company: 'ManyActive',
        description: 'ManyActive is a comprehensive fitness application '
            'enabling users to monitor their moods, assess their health, '
            'join fitness challenges, and more.\n'
            'The app is currently used in more than 2 countries.',
        technologies: [
          'Flutter',
          'Dart',
          'Kotlin',
          'Android',
          'iOS',
          'REST',
          'Firebase',
          'Flutterwave',
        ],
      ),
    ];
  }
}
