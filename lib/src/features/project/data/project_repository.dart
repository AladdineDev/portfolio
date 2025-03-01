import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:portfolio/src/features/project/domain/project.dart';
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
      const Project(
        title: 'Nearpays',
        description: 'A finance application that offers virtual USD cards for '
            'international payment, virtual accounts to businesses and individuals, '
            'savings platform with high a interest yield, and many more.',
        url: 'https://apps.apple.com/ng/app/nearpays/id6446233465',
        photoUrl: 'assets/screenshots/nearpays.png',
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'REST',
          'Firebase',
          'Shorebird',
          'NFC',
        ],
      ),
      const Project(
        title: 'Manyactive',
        description: 'A fitness app allowing users to create and join various '
            'fitness challenges. It includes features such as mood tracking, '
            'comprehensive reports, stories, and communities.',
        url: 'https://apps.apple.com/us/app/manyactive/id6444879591',
        photoUrl: 'assets/screenshots/manyactive.png',
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
      const Project(
        title: 'Twinku',
        description: 'A modern wealth management application that is aimed at '
            'solving the problem of unclaimed assets after death due to '
            'unavailability of enough paper-works to process claims by relatives.',
        url: 'https://apps.apple.com/us/app/twinku/id1599968399',
        photoUrl: 'assets/screenshots/twinku.png',
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
      ),
      const Project(
        title: 'Beere',
        description:
            'An application connecting buyers with vendors. It displays '
            'a list of vendors based on proximity, allowing vendors to upload '
            'products, make promotions, and view performance statistics. '
            'Buyers can search for and request products.',
        url: 'https://apps.apple.com/us/app/beere/id6450223083',
        photoUrl: 'assets/screenshots/beere.png',
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'REST',
          'Google Places',
          'Google SignIn',
        ],
      ),
      const Project(
        title: 'Uniflow',
        description: 'A financial advisory and management application. It '
            'decentralizes user data and ensure no user personal data is stored. '
            'Currently in testing stage.',
        url: 'https://universalflow.io',
        photoUrl: 'assets/screenshots/uniflow.png',
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
    ];
  }
}
