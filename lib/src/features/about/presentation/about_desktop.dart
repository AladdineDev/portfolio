import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AboutDesktop extends ConsumerWidget {
  const AboutDesktop({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 32),
          child: Text(
            'Profile', //context.localized.aboutSectionTitleAlt,
            style: Theme.of(context).textTheme.titleLarge,
          ),
        ),
        Text(
          'Experienced Flutter Developer with a passion for creating intuitive '
          'and high-performance mobile apps for both Android and iOS '
          'platforms. With over 6 years in the tech industry, I\'ve '
          'collaborated with multidisciplinary teams to translate user '
          'needs into responsive applications. My core expertise lies in '
          'Dart, REST APIs & GraphQL, Firebase, Third party APIs and SDKs '
          'integration and custom widget development. I have also worked with '
          'Kotlin and Java to create native android apps as well as spring boot '
          'to create serverside applications and microservices. Adept at requirements '
          'analysis, software modeling, and swift adaptation to emerging technologies. '
          'I\'m always eager to explore new advancements in Flutter and continuously '
          'incorporate them into my projects. Let\'s connect and transform '
          'your next app idea into a reality!', //context.localized.about,
          textAlign: TextAlign.justify,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}
