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
        url:
            'https://play.google.com/store/apps/details?id=com.squirrellabs.beere.beere_mobile',
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
      const Project(
        title: 'OpsManager',
        description: 'An application used by the technical staff of '
            'Ibadan Electricity Distribution Company (IBEDC) to perform '
            'various functions like customer enumeration, evaluation, bill '
            'distribution, meter reading, disconnection/reconnection, etc.',
        url:
            'https://play.google.com/store/apps/details?id=com.monarchtechnologies.opsmanagerapp',
        photoUrl: 'assets/screenshots/ops_manager.png',
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'REST',
          'SQFLITE',
        ],
      ),
      const Project(
        title: 'Power Supply Monitoring System (PSMS)',
        description: 'Developed for IBEDC to monitor power supply on injection '
            'substations and feeders across different regions and business hubs.',
        url:
            'https://play.google.com/store/apps/details?id=com.monarchtechnologies.tcn1',
        photoUrl: 'assets/screenshots/psms.png',
        technologies: [
          'Flutter',
          'Dart',
          'Android',
          'iOS',
          'REST',
          'SQFLITE',
        ],
      ),
    ];
  }
}
